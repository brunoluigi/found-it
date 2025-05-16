# frozen_string_literal: true

module RubyUI
  class StatBlock < Base
    def initialize(label:, value:)
      @label = label
      @value = value
    end

    def view_template
      div(class: "text-center p-3") do
        span(class: "block text-3xl font-bold") { @value }
        span(class: "text-gray-600") { @label }
      end
    end
  end
end
