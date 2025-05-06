# frozen_string_literal: true

module RubyUI
  class ItemForm < Base
    def initialize(item:)
      @item = item
    end

    def view_template
      raw(helpers.form_with(model: @item) do |form|
        render ErrorMessages.new(object: @item)
        div(class: "mb-4") do
          Label(text: form.label(:content), for_attr: nil)
          TextArea(form:, field: :content)
        end

        div(class: "flex gap-4") do
          Button { "Save Item" }
        end
      end
      )
    end
  end
end
