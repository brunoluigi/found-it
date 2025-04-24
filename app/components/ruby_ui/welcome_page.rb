# frozen_string_literal: true

module RubyUI
  class WelcomePage < Base
    def initialize(user:)
      @user = user
    end

    def view_template
      div(class: "container mx-auto px-4 py-8") do
        div(class: "max-w-4xl mx-auto") do
          div(class: "flex justify-center mb-8") do
            img(src: "/foundit_logo_camper_final.svg", alt: "FoundIT Logo", width: 120, height: 120)
          end

          Card do
            Heading(level: 1, classes: "text-3xl font-bold mb-4") { "Welcome to FoundIT, #{@user.name}!" }
            Text(classes: "text-lg mb-4") { "Your personal item tracking assistant is ready to help you keep track of all your belongings." }

            div(class: "bg-gray-100 border border-gray-300 p-4 rounded-sm mb-6") do
              Heading(level: 2, classes: "text-xl font-bold mb-2") { "Quick Stats" }
              Grid(cols: 1, md_cols: 3, gap: 4) do
                StatBlock(label: "Items Registered", value: 0)
                StatBlock(label: "Items Found", value: 0)
                StatBlock(label: "Active Searches", value: 0)
              end
            end

            Grid(cols: 1, md_cols: 2, gap: 6, classes: "mb-8") do
              Card do
                Heading(level: 3, classes: "text-xl font-bold mb-3") { "Register New Item" }
                Text(classes: "mb-4 block") { "Add your valuable items to FoundIT to make them easier to recover if lost." }
                a(class: "block", href: "/items/new") do
                  Button { "Register Item" }
                end
              end

              Card do
                Heading(level: 3, classes: "text-xl font-bold mb-3") { "Report Lost Item" }
                Text(classes: "mb-4 block") { "Report an item as lost to help the community recover it." }
                a(class: "block", href: "/lost_items/new") do
                  Button { "Report Lost Item" }
                end
              end
            end
          end
        end
      end
    end
  end
end
