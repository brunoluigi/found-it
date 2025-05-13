# frozen_string_literal: true

module RubyUI
  class ItemsIndexPage < Base
    def initialize(items:)
      @items = items
    end

    def view_template
      Card(class: "max-w-2xl mx-auto", data: { controller: "items-index-page" }) do
        Heading(level: 1) { "My Items" }

        div do
          Link(href: helpers.new_item_path, variant: :button) { "New Item" }
        end

        ul(class: "mt-6 divide-y divide-gray-200") do
          @items.each do |item|
            li(class: "flex justify-between items-center py-4 gap-6") do
              span(class: "flex-1") do
                Link(href: helpers.item_path(item), classes: "hover:underline") { item.content.truncate(60) }
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
                Link(href: helpers.edit_item_path(item)) { "Edit" }
                Link(href: helpers.item_path(item), data: { turbo_method: :delete, turbo_confirm: "Are you sure?" }) { "Delete" }
              end
            end
          end
        end
      end
    end
  end
end
