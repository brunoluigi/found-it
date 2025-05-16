# frozen_string_literal: true

module RubyUI
  class ItemNotFoundPage < Base
    def initialize(item_id:)
      @item_id = item_id
    end

    def view_template
      Card(class: "max-w-xl mx-auto") do
        div(class: "flex flex-col items-center justify-center mb-4") do
          svg(
            xmlns: "http://www.w3.org/2000/svg",
            fill: "none",
            viewBox: "0 0 64 64",
            class: "mb-2 stroke-primary fill-primary",
            width: "56",
            height: "56"
          ) do |s|
            s.circle(cx: "32", cy: "32", r: "30", stroke_width: "4", fill: "white")
            s.circle(cx: "22", cy: "28", r: "4")
            s.circle(cx: "42", cy: "28", r: "4")
            s.path(d: "M22 44c3-4 13-4 16 0", stroke_width: "4", fill: "none", stroke_linecap: "round")
          end
          Heading(level: 1, class: "text-primary text-center") { "Item Not Found" }
        end

        p(class: "mb-4 text-lg") { "Sorry, we couldn't find an item for the given link." }
        p(class: "mb-8 text-gray-600") { "It may have been deleted, or you may have followed an invalid link." }
      end
    end
  end
end
