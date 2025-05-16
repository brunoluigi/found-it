# frozen_string_literal: true

module RubyUI
  class LoadingIcon < Base
    def view_template
      svg(class: "h-12 w-12 animate-spin stroke-primary", xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 48 48", fill: "none") do |s|
        # Background track
        s.circle(cx: "24", cy: "24", r: "20", stroke_width: "6", class: "opacity-20")
        # Foreground arc (spinner)
        s.path(d: "M44 24a20 20 0 1 1-20-20", stroke_width: "6")
        # White highlight for extra contrast
        s.path(d: "M24 4a20 20 0 0 1 20 20", stroke: "#fff", stroke_width: "4", stroke_linecap: "round", class: "opacity-90")
      end
    end
  end
end
