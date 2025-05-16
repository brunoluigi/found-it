# frozen_string_literal: true

module RubyUI
  class EmptyListIcon < Base
    def view_template
      svg(class: "mx-auto h-28 w-28 fill-primary", xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 96 96", fill: "none") do |s|
        # Big, square, high-contrast list outline
        s.rect(x: "16", y: "20", width: "64", height: "64", rx: "8", fill: "#fff", stroke: "#111", stroke_width: "5")
        # Bold red list lines
        s.rect(x: "28", y: "36", width: "40", height: "6", rx: "2.5", stroke: "#111", stroke_width: "1.5")
        s.rect(x: "28", y: "50", width: "32", height: "6", rx: "2.5", stroke: "#111", stroke_width: "1.5")
        s.rect(x: "28", y: "64", width: "20", height: "6", rx: "2.5", stroke: "#111", stroke_width: "1.5")
      end
    end
  end
end
