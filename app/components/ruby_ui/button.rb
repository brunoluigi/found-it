# frozen_string_literal: true

module RubyUI
  class Button < Base
    def initialize(classes: "bg-black text-white font-bold py-2 px-4 shadow-[3px_3px_0_#e21836] hover:bg-gray-800 transition-all duration-150", **attrs)
      @classes = classes
      @attrs = attrs
    end
    def view_template(&block)
      button(class: @classes, **@attrs) { yield }
    end
  end
end
