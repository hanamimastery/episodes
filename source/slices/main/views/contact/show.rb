# frozen_string_literal: true

module Main
  module Views
    module Contact
      class Show < Main::View
        expose :title
        expose :contact, default: {}
        expose :errors, default: {}

        def title
          "Cannot subscribe?! Oh no! Let us know what happens!"
        end
      end
    end
  end
end
