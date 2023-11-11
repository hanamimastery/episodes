# frozen_string_literal: true

module Main
  module Actions
    module Home
      # Processes show action.
      class Show < Main::Action
        def handle(*, response)
          response.body = Views::Home::Show.new.call
        end
      end
    end
  end
end
