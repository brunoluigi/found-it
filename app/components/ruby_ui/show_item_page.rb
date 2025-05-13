# frozen_string_literal: true

module RubyUI
  class ShowItemPage < Base
    def initialize(item:)
      @item = item
      @item_view = @item.item_views.order(:updated_at).last
      @item_view_found = @item.item_views.found.order(:found_it_at).last
    end

    def view_template
      Card(class: "max-w-xl mx-auto") do
        Heading(level: 1, classes: "text-2xl font-bold mb-6") { "Item Details" }
        div(class: "mb-8 text-lg") do
          p { @item.content }
          p { "Created: #{helpers.time_ago_in_words(@item.created_at)} ago" }
          p { "Last view: #{@item_view ? helpers.time_ago_in_words(@item_view.updated_at) + " ago" : "Never"}" }
          p { "Found at: #{@item_view_found ? helpers.time_ago_in_words(@item_view_found.found_it_at) + " ago" : "Never"}" }
        end
        div(class: "flex justify-between items-center mb-6") do
          div(class: "flex flex-col gap-4") do
            qrcode = RQRCode::QRCode.new(helpers.item_view_url(@item))
            div { helpers.raw qrcode.as_svg(module_size: 3, standalone: true) }

            Clipboard(success: "Copied!", error: "Copy failed!", class: "relative", options: { placement: "top" }) do
              ClipboardSource(class: "hidden") { span { helpers.item_view_url(@item) } }

              ClipboardTrigger do
                Link(href: "#") { "Copy Link" }
              end
            end
          end
        end

        div(class: "flex gap-4") do
          render Link.new(href: helpers.edit_item_path(@item)) { "Edit" }
          render Link.new(href: helpers.items_path) { "Back" }
          render Link.new(
            href: helpers.item_path(@item),
            data: { turbo_method: :delete, turbo_confirm: "Are you sure?" }
          ) { "Delete" }
        end
      end
    end
  end
end
