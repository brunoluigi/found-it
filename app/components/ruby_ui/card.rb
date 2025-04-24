# frozen_string_literal: true

module RubyUI
  class Card < Base
    def initialize(classes: nil, shadow: "shadow-[5px_5px_0_#e21836]", padding: "p-4", background: "bg-white", **attrs)
      @classes = classes
      @shadow = shadow
      @padding = padding
      @background = background
      @attrs = attrs
    end

    def view_template(&block)
      classes = @classes || [ @background, "border-2 border-black", @shadow, @padding, "mb-8" ].reject(&:empty?).join(" ")
      div(class: classes, **@attrs) do
        yield
      end
    end
  end
end
