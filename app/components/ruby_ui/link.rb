# frozen_string_literal: true

module RubyUI
  class Link < Base
    def initialize(variant: :link, **attrs)
      @variant = variant.to_sym

      super(**attrs)
    end

    def view_template(&)
      a(**attrs, &)
    end

    private

    def default_classes
      case @variant
      when :link then "font-bold underline text-primary hover:text-black transition-colors"
      when :button then "bg-black text-white font-bold py-2 px-4 shadow-[3px_3px_0] shadow-primary hover:bg-gray-800 transition-all duration-150"
      end
    end

    def default_attrs
      {
        type: "button",
        class: default_classes
      }
    end
  end
end
