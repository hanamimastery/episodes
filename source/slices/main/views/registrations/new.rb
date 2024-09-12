# frozen_string_literal: true

module Main
  module Views
    module Registrations
      class New < Main::View
        expose(:form, as: Parts::Forms::Registration) do |values: {}, errors: {}|
          {
            values: values,
            errors: errors
          }
        end
      end
    end
  end
end
