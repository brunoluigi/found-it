# frozen_string_literal: true

module RubyUI
  class Heading < Base
    def initialize(level: 1, classes: "")
      @level = level
      @classes = classes
    end
    def view_template(&block)
      tag = "h#{@level}"
      send(tag, class: @classes) { yield }
    end
  end
end
