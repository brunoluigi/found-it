# frozen_string_literal: true

module RubyUI
  class Button < Base
    VARIANT_CLASSES = {
      primary: "bg-black text-white font-bold py-2 px-4 shadow-[3px_3px_0] shadow-primary hover:bg-gray-800 transition-all duration-150",
      secondary: "bg-transparent text-black font-bold py-2 px-4 border-2 border-primary shadow-[3px_3px_0_#111] hover:bg-gray-100 transition-all duration-150",
      danger: "bg-red-600 text-white font-bold py-2 px-4 shadow-[3px_3px_0_#111] hover:bg-red-800 transition-all duration-150"
    }

    def initialize(variant: :primary, classes: nil, href: nil, **attrs)
      base_classes = VARIANT_CLASSES[variant.to_sym] || VARIANT_CLASSES[:primary]
      @classes = [ base_classes, classes ].compact.join(" ")
      @href = href

      super(**attrs)
    end

    def view_template(&block)
      if @href
        a(class: @classes, href: @href, **@attrs) { yield }
      else
        button(class: @classes, **@attrs) { yield }
      end
    end
  end
end
