# frozen_string_literal: true

require 'dry/monads/result'
require 'dry/matcher/result_matcher'

module Onboarding
  module Endpoints
    module CreateUser
      class Action
        include Dry::Monads[:do, :result, :try]
        include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)

        def call(request)
          model, auth = yield deserializer.call(request)
          yield authorizer.call(model, auth)
          res = yield validator.call(model)
          yield create_user.call(res.to_h)

          Success(status: 201)
        end

        private

        attr_reader :deserializer, :authorizer, :validator, :create_user

        def initialize
          @authorizer = Authorizer.new
          @validator = Validator.new(repository: User)
          @deserializer = Deserializer.new
          @create_user = Operations::CreateUser.new
        end
      end
    end
  end
end
