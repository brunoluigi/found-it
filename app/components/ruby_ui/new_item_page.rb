# frozen_string_literal: true

module RubyUI
  class NewItemPage < Base
    def initialize(item:)
      @item = item
    end

    def view_template
      Card(class: "max-w-xl mx-auto") do
        Heading(level: 1) { "Register New Item" }
        render ItemForm.new(item: @item)
        div(class: "mt-6") do
          render Link.new(href: helpers.items_path) { "Back" }
        end
      end
    end
  end
end
