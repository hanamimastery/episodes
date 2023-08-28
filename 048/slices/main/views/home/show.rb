# frozen_string_literal: true

module Main
  module Views
    module Home
      # Renders show view.
      class Show < Main::View
        expose :title

        def title
          "Welcome to HanamiMastery!"
        end
      end
    end
  end
end
