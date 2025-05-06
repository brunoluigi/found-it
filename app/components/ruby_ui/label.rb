# frozen_string_literal: true

module RubyUI
  class Label < Base
    def initialize(text:, for_attr: nil, classes: "block mb-2 font-semibold", **attrs)
      @text = text
      @for_attr = for_attr
      @classes = classes
      @attrs = attrs
    end

    def view_template
      label(class: @classes, for: @for_attr, **@attrs) { @text }
    end
  end
end
