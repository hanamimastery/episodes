# frozen_string_literal: true

module Main
  module Actions
    module Contact
      class Show < Main::Action
        def handle(*, response) = response.render view
      end
    end
  end
end
