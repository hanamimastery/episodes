# frozen_string_literal: true

module Sandbox
  module Actions
    module Home
      class Show < Sandbox::Action
        def handle(*, res)
          res.body = 'Welcome to Sandbox'
        end
      end
    end
  end
end
