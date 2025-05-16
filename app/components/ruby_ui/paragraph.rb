# frozen_string_literal: true

module RubyUI
  class Paragraph < Base
    def view_template(&)
      p(**attrs, &)
    end

    private

    def default_attrs
      {
        class: "text-md"
      }
    end
  end
end
