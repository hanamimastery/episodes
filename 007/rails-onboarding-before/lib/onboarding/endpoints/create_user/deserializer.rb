# frozen_string_literal: true

require 'dry/monads/result'

module Onboarding
  module Endpoints
    module CreateUser
      class Deserializer
        include Dry::Monads[:do, :result, :try]
        include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)

        def call(request)
          # just for simplicity
          params = ActionController::Parameters.new(request.params)

          model = yield deserialize(params)
          auth = yield authorize(request.headers['Authorization'])

          Success([model, auth])
        end

        private

        def deserialize(params)
          res = Try[ActionController::ParameterMissing] do
            params.require(:user).permit(:name, :email).to_h
          end

          res.error? ? Failure(:deserialize) : res
        end

        def authorize(token)
          Success(token.to_s.gsub('Bearer ', ''))
        end
      end
    end
  end
end
