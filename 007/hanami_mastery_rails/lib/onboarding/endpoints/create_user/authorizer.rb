# frozen_string_literal: true

require 'dry/monads/result'

module Onboarding
  module Endpoints
    module CreateUser
      class Authorizer
        include Dry::Monads[:result]

        def call(model, auth)
          auth.present? ? Success() : Failure(:authorize)
        end
      end
    end
  end
end
