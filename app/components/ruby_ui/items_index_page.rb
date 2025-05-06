# frozen_string_literal: true

module RubyUI
  class ItemsIndexPage < Base
    def initialize(items:)
      @items = items
    end

    def view_template
      Card(classes: "max-w-2xl mx-auto bg-white border-2 border-black shadow-[5px_5px_0_#e21836] p-8 mt-10") do
        Heading(level: 1, classes: "text-2xl font-bold mb-6") { "My Items" }
        div do
          Link(href: helpers.new_item_path, variant: :button) { "New Item" }
        end
        ul(class: "mt-6 divide-y divide-gray-200") do
          @items.each do |item|
            li(class: "flex justify-between items-center py-4 gap-6") do
              span(class: "flex-1") do
                render Link.new(href: helpers.item_path(item), classes: "hover:underline") { item.content.truncate(60) }
              end
              span(class: "flex-shrink-0") do
                # QR code
                qrcode = RQRCode::QRCode.new(helpers.item_url(item))
                helpers.raw qrcode.as_svg(module_size: 3, standalone: true)
              end
              span(class: "flex gap-2 flex-shrink-0") do
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
