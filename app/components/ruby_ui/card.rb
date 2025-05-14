# frozen_string_literal: true

module RubyUI
  class Card < Base
    def view_template(&)
      div(**@attrs, &)
    end

    private

    def default_attrs
      {
        class: "mt-10 border-2 border-black shadow-[5px_5px_0] shadow-primary p-8 mb-8"
      }
    end
  end
end
