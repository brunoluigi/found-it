# frozen_string_literal: true

module RubyUI
  class TextArea < Base
    def initialize(form:, field:, rows: 5, **attrs)
      @form = form
      @field = field
      @rows = rows

      super(**attrs)
    end

    def view_template(&)
      render(raw @form.text_area @field, rows: @rows, **attrs, &)
    end

    private

    def default_attrs
      {
        class: "w-full border border-black shadow-[2px_2px_0] shadow-primary px-3 py-2 focus:ring-2 focus:ring-black focus:border-black transition"
      }
    end
  end
end
