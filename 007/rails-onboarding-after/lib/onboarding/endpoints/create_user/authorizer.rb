# frozen_string_literal: true

require 'dry/monads/result'

module Onboarding
  module Endpoints
    module CreateUser
      class Authorizer
        include Dry::Monads[:result]

        def call(_model, auth)
          auth.length.zero? ? Failure(:authorize) : Success()
        end
      end
    end
  end
end
