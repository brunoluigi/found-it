# frozen_string_literal: true

module RubyUI
  class TextArea < Base
    def initialize(form:, field:, classes: "w-full border border-black shadow-[2px_2px_0] shadow-primary px-3 py-2 focus:ring-2 focus:ring-black focus:border-black transition", rows: 5, **attrs)
      @form = form
      @field = field
      @classes = classes
      @rows = rows
      @attrs = attrs
    end

    def view_template(&block)
      render raw @form.text_area @field, class: @classes, rows: @rows, **@attrs, &block
    end
  end
end
