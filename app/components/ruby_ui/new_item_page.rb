# frozen_string_literal: true

module RubyUI
  class NewItemPage < Base
    def initialize(item:)
      @item = item
    end

    def view_template
      Card(classes: "max-w-xl mx-auto bg-white border-2 border-black shadow-[5px_5px_0_#e21836] p-8 mt-10") do
        Heading(level: 1, classes: "text-2xl font-bold mb-6") { "Register New Item" }
        render ItemForm.new(item: @item)
        div(class: "mt-6") do
          render Link.new(href: helpers.items_path) { "Back" }
        end
      end
    end
  end
end
