# frozen_string_literal: true

module RubyUI
  class ShowItemPage < Base
    include Phlex::Rails::Helpers::L

    def initialize(item:)
      @item = item
      @item_view = @item.item_views.order(:updated_at).last
      @item_view_found = @item.item_views.found.order(:found_it_at).last
    end

    def view_template
      Card(class: "max-w-xl mx-auto") do
        div(class: "flex justify-between items-start mb-6") do
          div do
            Heading(level: 1, class: "text-2xl font-bold") { "Item Details" }
            div(class: "mb-4") do
              Paragraph { @item.content }
              Paragraph { "Created: #{helpers.time_ago_in_words(@item.created_at)} ago" }
              Paragraph { "Last view: #{@item_view ? helpers.time_ago_in_words(@item_view.updated_at) + " ago" : "Never"}" }
              Paragraph { "Found at: #{@item_view_found ? helpers.time_ago_in_words(@item_view_found.found_it_at) + " ago" : "Never"}" }
            end
        end
        div(class: "flex justify-between items-center mb-6") do
          div(class: "flex flex-col gap-4") do
            qrcode = RQRCode::QRCode.new(helpers.item_view_url(@item))
            div { helpers.raw qrcode.as_svg(module_size: 3, standalone: true) }

              Clipboard(success: "Copied!", error: "Copy failed!", class: "relative", options: { placement: "top" }) do
                ClipboardSource(class: "hidden") { span { helpers.item_view_url(@item) } }

                ClipboardTrigger do
                  Link(href: "#") { "Copy Link" }
                end
              end
            end
          end
        end

        div(class: "flex gap-4") do
          render Link.new(href: helpers.edit_item_path(@item)) { "Edit" }
          render Link.new(href: helpers.items_path) { "Back" }
          render Link.new(
            href: helpers.item_path(@item),
            data: { turbo_method: :delete, turbo_confirm: "Are you sure?" }
          ) { "Delete" }
        end
      end

      # --- ItemView Listing Section as a Card ---
      if @item.item_views.any?
        Card(class: "max-w-xl mx-auto mt-8") do
          Heading(level: 2, class: "text-xl font-semibold mb-4") { "View History" }
          div(class: "flex flex-col") do
            @item.item_views.order(updated_at: :desc).each do |view|
              div(class: "flex flex-col sm:flex-row sm:items-center justify-between bg-white border-2 border-white border-b-gray-500 hover:border-b-primary hover:border-solid border-dashed p-4 transition group") do
                div(class: "flex flex-col sm:flex-row sm:items-center gap-2 flex-1") do
                  span(class: "flex items-center gap-1 text-gray-700 font-medium") do
                    # Eye icon (SVG)
                    svg(xmlns: "http://www.w3.org/2000/svg", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor", class: "w-4 h-4 text-primary") do |s|
                      s.path(stroke_linecap: "round", stroke_linejoin: "round", d: "M2.25 12s3.75-7.5 9.75-7.5 9.75 7.5 9.75 7.5-3.75 7.5-9.75 7.5S2.25 12 2.25 12z")
                      s.path(stroke_linecap: "round", stroke_linejoin: "round", d: "M15 12a3 3 0 11-6 0 3 3 0 016 0z")
                    end
                    span { helpers.time_ago_in_words(view.updated_at) + " ago" }
                  end
                end
                div(class: "flex items-center gap-2 mt-2 sm:mt-0") do
                  if view.found_it_at.present?
                    HoverCard do
                      HoverCardTrigger do
                        span(class: "inline-block px-2 py-1 bg-lime-200 text-xs font-semibold cursor-pointer") { "Found" }
                      end
                      HoverCardContent do
                        div(class: "flex flex-col gap-4") do
                          Heading(level: 4) { "Message" }
                          Paragraph(class: "text-sm") { view.found_it_message }
                          Text(class: "text-xs text-muted-foreground") { "Found it at #{l(view.found_it_at, format: :short)}" }
                        end
                      end
                    end
                  else
                    span(class: "inline-block px-2 py-1 bg-cyan-200 text-xs font-semibold") { "Viewed" }
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
