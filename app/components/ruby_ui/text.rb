# frozen_string_literal: true

module RubyUI
  class Text < Base
    def initialize(classes: "")
      @classes = classes
    end
    def view_template(&block)
      span(class: @classes) { yield }
    end
  end
end
