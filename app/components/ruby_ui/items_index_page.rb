# frozen_string_literal: true

module RubyUI
  class ItemsIndexPage < Base
    include Phlex::Rails::Helpers::TurboFrameTag
    include Phlex::Rails::Helpers::FormWith

    def initialize(items:, show_found: nil, show_viewed: nil)
      @items = items
      @show_found = show_found
      @show_viewed = show_viewed
    end

    def view_template
      Card(class: "max-w-2xl mx-auto", data: { controller: "items-index-page" }) do
        Heading(level: 1) { "My Items" }

        div do
          Link(href: helpers.new_item_path, variant: :button) { "New Item" }
        end

        turbo_frame_tag "items-list", data: { controller: "items-index-frame" } do
          form_with url: helpers.items_path, method: :get, data: { turbo_frame: "items-list" }, class: "mt-6 flex justify-end gap-4 items-center", id: "items-filter-form" do
            div(class: "flex gap-2") do
              Label(for: "show_found") { "Filter Found" }
              Switch(
                id: "show_found",
                name: "show_found",
                checked_value: "1",
                unchecked_value: "0",
                checked: @show_found == "1",
                data: { action: "change->items-index-page#filter" }
              )
            end
            div(class: "flex gap-2") do
              Label(for: "show_viewed") { "Filter Viewed" }
              Switch(
                id: "show_viewed",
                name: "show_viewed",
                checked_value: "1",
                unchecked_value: "0",
                checked: @show_viewed == "1",
                data: { action: "change->items-index-page#filter" }
              )
            end
          end

          div(id: "items-list-loading", class: "hidden w-full flex justify-center py-8") do
            LoadingIcon()
          end

          if @items.empty?
            div(class: "flex flex-col items-center justify-center py-12") do
              EmptyListIcon()
              span(class: "mt-4 text-lg text-gray-700 font-semibold") { "Nothing here =/" }
            end
          else
            ul(id: "items-list-list", class: "divide-y divide-gray-200 mt-4") do
              @items.each do |item|
                li(class: "flex justify-between items-center py-4 gap-6") do
                  span(class: "flex-1") do
                    Link(href: helpers.item_path(item), data: { turbo_frame: "_top" }) { item.content.truncate(60) }
                  end

                  span(class: "flex gap-2 flex-shrink-0") do
                    HoverCard do
                      HoverCardTrigger do
                        Link(id: "items-qrcode-link-#{item.id}", href: "#", class: "block") { "QR Code" }
                      end
                      HoverCardContent do
                        div(class: "flex flex-col gap-4") do
                          qrcode = RQRCode::QRCode.new(helpers.item_view_url(item))
                          div { helpers.raw qrcode.as_svg(module_size: 3, standalone: true) }

                          Clipboard(success: "Copied!", error: "Copy failed!", class: "relative", options: { placement: "top" }) do
                            ClipboardSource(class: "hidden") { span { helpers.item_view_url(item) } }

                            ClipboardTrigger do
                              Link(href: "#") { "Copy Link" }
                            end
                          end
                        end
                      end
                    end
                    Link(href: helpers.edit_item_path(item), data: { turbo_frame: "_top" }) { "Edit" }
                    Link(href: helpers.item_path(item), data: { turbo_method: :delete, turbo_confirm: "Are you sure?" }) { "Delete" }
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
