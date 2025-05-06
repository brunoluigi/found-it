# frozen_string_literal: true

module RubyUI
  class Grid < Base
    def initialize(cols: 1, md_cols: nil, gap: 4, classes: "")
      @cols = cols
      @md_cols = md_cols
      @gap = gap
      @classes = classes
    end
    def view_template(&block)
      classes = [
        "grid grid-cols-#{@cols}",
        (@md_cols ? "md:grid-cols-#{@md_cols}" : nil),
        "gap-#{@gap}",
        @classes
      ].compact.join(" ")
      div(class: classes) { yield }
    end
  end
end
