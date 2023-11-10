# frozen_string_literal: true

module Main
  module Actions
    module Home
      class Show < Main::Action
        def handle(_req, res)
          res.body = '<h1>New way of routing!</h1>'
        end
      end
    end
  end
end
