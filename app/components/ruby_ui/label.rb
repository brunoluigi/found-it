# frozen_string_literal: true

module RubyUI
  class Label < Base
    def view_template(&)
      label(**attrs, &)
    end

    private

    def default_attrs
      {
        class: "block mb-2 font-semibold"
      }
    end
  end
end
