# frozen_string_literal: true

module RubyUI
  class FoundItForm < Base
    include Phlex::Rails::Helpers::FormWith
    def initialize(item_view:)
      @item_view = item_view
    end

    def view_template
        form_with(model: @item_view, url: Rails.application.routes.url_helpers.item_view_path(@item_view), method: :patch) do |f|
          div(class: "mb-4") do
            f.label(:found_it_message, "Describe how and where you found the item", class: "block font-bold mb-2")
            f.text_area(:found_it_message, rows: 3, class: "w-full border rounded p-2")
          end
          div(class: "flex gap-4") do
            Button { "Submit" }
            Button(
              variant: :danger,
              id: "hide-found-it-form",
              data: { "public-item-info-page-target": "foundItButton", action: "public-item-info-page#hideForm" }
            ) { "Cancel" }
          end
        end
    end
  end
end
