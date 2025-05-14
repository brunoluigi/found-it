# frozen_string_literal: true

module RubyUI
  class ErrorMessages < Base
    def initialize(object:, **attrs)
      @object = object

      super(**attrs)
    end

    def view_template
      return unless @object.errors.any?

      div(**attrs) do
        h2 { "#{@object.errors.count} #{'error'.pluralize(@object.errors.count)} prohibited this #{@object.model_name.human.downcase} from being saved:" }
        ul do
          @object.errors.full_messages.each do |msg|
            li { msg }
          end
        end
      end
    end

    private

    def default_attrs
      {
        class: "mb-4 text-red-600"
      }
    end
  end
end
