# frozen_string_literal: true

module RubyUI
  class Grid < Base
    def initialize(cols: 1, md_cols: nil, gap: 4, **attrs)
      @cols = cols
      @md_cols = md_cols
      @gap = gap

      super(**attrs)
    end

    def view_template(&)
      div(**attrs, &)
    end

    private

    def grid_classes
      [
        "grid grid-cols-#{@cols}",
        (@md_cols ? "md:grid-cols-#{@md_cols}" : nil),
        "gap-#{@gap}"
      ]
    end

    def default_attrs
      {
        class: grid_classes
      }
    end
  end
end
