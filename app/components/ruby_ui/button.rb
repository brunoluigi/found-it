# frozen_string_literal: true

module RubyUI
  class Button < Base
    VARIANT_CLASSES = {
      primary: "bg-black text-white font-bold py-2 px-4 shadow-[3px_3px_0] shadow-primary hover:bg-gray-800 transition-all duration-150",
      secondary: "bg-transparent text-black font-bold py-2 px-4 border-2 border-primary shadow-[3px_3px_0_#111] hover:bg-gray-100 transition-all duration-150",
      danger: "bg-red-600 text-white font-bold py-2 px-4 shadow-[3px_3px_0_#111] hover:bg-red-800 transition-all duration-150"
    }

    def initialize(variant: :primary, href: nil, **attrs)
      @variant = variant.to_sym
      @href = href

      super(**attrs)
    end

    def view_template(&)
      if @href
        a(class: @class, href: @href, **attrs, &)
      else
        button(class: @class, **attrs, &)
      end
    end

    private

    def default_classes
      VARIANT_CLASSES[@variant] || VARIANT_CLASSES[:primary]
    end

    def default_attrs
      {
        class: default_classes
      }
    end
  end
end
