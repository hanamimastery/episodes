# frozen_string_literal: true

module Main
  module Actions
    module Home
      class Show < Action::Base
        def handle(req, res)
          res.status = 200
          res.body = "<h3>Hello, awesome suscriber!</h3>"
        end
      end
    end
  end
end
