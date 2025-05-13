# frozen_string_literal: true

module RubyUI
  class PublicItemInfoPage < Base
    include Phlex::Rails::Helpers::TurboFrameTag

    def initialize(item:)
      @item = item
    end

    def view_template
      Card(class: "max-w-xl mx-auto", data: { controller: "public-item-info-page" }) do
        Heading(level: 1) { "Item Details" }
        p(class: "mb-8 text-lg") { @item.content }

        item_view = helpers.current_item_view_for(@item)

        if item_view&.found_it_at.present?
          div(class: "mt-8 p-4 bg-green-100 border border-green-400 rounded") do
            span { "Thank you for letting us know you found this item!" }
            if item_view.found_it_message.present?
              br
              span(class: "block mt-2 text-gray-700") { "Your message: #{item_view.found_it_message}" }
            end
          end
        else
          div do
            Button(
              id: "show-found-it-form",
              data: { "public-item-info-page-target": "foundItButton", action: "public-item-info-page#showForm" }
            ) { "Found it!" }
            div(class: "hidden mt-4", data: { "public-item-info-page-target": "foundItForm" }) do
              render RubyUI::FoundItForm.new(item_view: item_view)
            end
          end
        end
      end
    end
  end
end
