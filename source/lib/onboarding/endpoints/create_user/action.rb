# frozen_string_literal: true

require 'dry/monads'
require 'dry/matcher/result_matcher'

module Onboarding
  module Endpoints
    module CreateUser
      class Action
        include Dry::Monads[:do, :result]
        include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)

        def call(request)
          model, auth = yield deserializer.call(request)
          yield authorizer.call(model, auth)
          res = yield validator.call(model.to_h)
          yield create_user.call(res.to_h)

          Success(status: :created)
        end

        private

        attr_reader :deserializer, :authorizer, :validator, :create_user

        def initialize
          @authorizer = Authorizer.new
          @deserializer = Deserializer.new
          @validator = Validator.new(repository: User)
          @create_user = Operations::CreateUser.new
        end
      end
    end
  end
end
