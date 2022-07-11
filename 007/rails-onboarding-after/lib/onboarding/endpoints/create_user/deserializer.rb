# frozen_string_literal: true

require 'dry/monads/result'

module Onboarding
  module Endpoints
    module CreateUser
      class Deserializer
        include Dry::Monads[:do, :result, :try]

        def call(request)
          params = ActionController::Parameters.new(request.params)

          model = yield deserialize(params)
          auth = yield fetch_token(request)

          Success([model, auth])
        end

        private

        def deserialize(params)
          res = Try[ActionController::ParameterMissing] do
            params.require(:user).permit(:name, :email)
          end

          res.error? ? Failure(:deserialize) : res
        end

        def fetch_token(request)
          token = request.headers['Authorization'].to_s
          Success(token.gsub('Bearer ', ''))
        end
      end
    end
  end
end
