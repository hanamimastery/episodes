# frozen_string_literal: true

module Main
  module Views
    module Home
      # Renders show view.
      class Show < Main::View
        def template
          render ApplicationLayout.new do
            h1(class: "title is-h1") { "Consider subscribing?" }

            div(id: "parent") do
              button(class: "button is-primary") do
                "Click me to subscribe!"
              end
            end
          end
        end
      end
    end
  end
end
