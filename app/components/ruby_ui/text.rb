# frozen_string_literal: true

module RubyUI
  class Text < Base
    def view_template(&)
      span(**attrs, &)
    end

    private

    def default_attrs
      {
        class: "text-md"
      }
    end
  end
end
