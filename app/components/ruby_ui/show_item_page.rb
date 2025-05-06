# frozen_string_literal: true

module RubyUI
  class ShowItemPage < Base
    def initialize(item:)
      @item = item
    end

    def view_template
      Card(classes: "max-w-xl mx-auto bg-white border-2 border-black shadow-[5px_5px_0_#e21836] p-8 mt-10") do
        Heading(level: 1, classes: "text-2xl font-bold mb-6") { "Item Details" }
        div(class: "flex justify-between items-center mb-6") do
          qrcode = RQRCode::QRCode.new(helpers.item_url(@item))
          helpers.raw qrcode.as_svg(module_size: 3, standalone: true)
        end
        p(class: "mb-8 text-lg") { @item.content }
        div(class: "flex gap-4") do
          render Link.new(href: helpers.edit_item_path(@item), classes: "bg-black text-white font-bold py-2 px-4  shadow-[3px_3px_0_#e21836] hover:bg-gray-800 transition-all duration-150") { "Edit" }
          render Link.new(href: helpers.items_path, classes: "bg-black text-white font-bold py-2 px-4  shadow-[3px_3px_0_#e21836] hover:bg-gray-800 transition-all duration-150") { "Back" }
          render Link.new(
            href: helpers.item_path(@item),
            data: { turbo_method: :delete, turbo_confirm: "Are you sure?" },
            classes: "bg-red-600 text-white font-bold py-2 px-4  shadow-[3px_3px_0_#e2183600] hover:bg-red-800 transition-all duration-150 inline"
          ) { "Delete" }
        end
      end
    end
  end
end
