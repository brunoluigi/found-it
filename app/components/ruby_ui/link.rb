# frozen_string_literal: true

module RubyUI
  class Link < Base
    def initialize(href:, variant: :link, classes: nil, **attrs)
      @href = href
      @variant = variant.to_sym

      super(**attrs)
    end

    def view_template(&block)
      a(href: @href, class: @classes, **attrs) { yield }
    end

    private

    def default_classes
      case @variant
      when :link then @classes || "font-bold underline text-[#e21836] hover:text-black transition-colors"
      when :button then @classes || "bg-black text-white font-bold py-2 px-4 shadow-[3px_3px_0_#e21836] hover:bg-gray-800 transition-all duration-150"
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
