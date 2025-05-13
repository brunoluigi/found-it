# frozen_string_literal: true

module RubyUI
  class Heading < Base
    LEVELS = {
      1 => "text-3xl font-bold mb-4",
      2 => "text-2xl font-bold mb-4",
      3 => "text-xl font-bold mb-3",
      4 => "text-base font-bold",
      5 => "text-sm font-bold",
      6 => "text-xs font-bold"
    }

    def initialize(level: 1, **attrs)
      @level = level

      super(**attrs)
    end

    def view_template(&block)
      tag = "h#{@level}"

      send(tag, **attrs) { yield }
    end

    private

    def default_attrs
      {
        class: [ "font-bold mb-6", LEVELS[@level] ]
      }
    end
  end
end
