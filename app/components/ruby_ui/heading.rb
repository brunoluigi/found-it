# frozen_string_literal: true

module RubyUI
  class Heading < Base
    LEVELS = {
      1 => "text-3xl mb-4",
      2 => "text-2xl mb-4",
      3 => "text-xl mb-3",
      4 => "text-base mb-1",
      5 => "text-sm mb-0",
      6 => "text-xs mb-0"
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
        class: [ "font-bold", LEVELS[@level] ]
      }
    end
  end
end
