# frozen_string_literal: true

module RubyUI
  class WelcomePage < Base
    def initialize(user:)
      @user = user
      @items_count = user.items.count
      @items_found_count = user.items.where.associated(:item_views).merge(ItemView.found).distinct.count(:id)
      @items_viewed_count = user.items.where.associated(:item_views).distinct.count(:id)
    end

    def view_template
      div(class: "container mx-auto px-4 py-8") do
        div(class: "max-w-4xl mx-auto") do
          Card do
            Heading(level: 1) { "Welcome to FoundIT, #{@user.name}!" }
            Text(classes: "text-lg mb-4") { "Your personal item tracking assistant is ready to help you keep track of all your belongings." }

            div(class: "bg-gray-100 border border-gray-300 p-4 rounded-sm mb-6") do
              Heading(level: 2) { "Quick Stats" }
              div(class: "grid grid-cols-3 gap-4") do
                StatBlock(label: "Items Registered", value: @items_count)
                StatBlock(label: "Items Viewed", value: @items_viewed_count)
                StatBlock(label: "Items Found", value: @items_found_count)
              end
            end

            Grid(cols: 1, md_cols: 2, gap: 6, classes: "mb-8") do
              Card do
                Heading(level: 3) { "Register New Item" }
                Text(classes: "mb-4 block") { "Add your valuable items to FoundIT to make them easier to recover if lost." }
                Button(href: helpers.new_item_path) { "Register Item" }
              end
            end
          end
        end
      end
    end
  end
end
