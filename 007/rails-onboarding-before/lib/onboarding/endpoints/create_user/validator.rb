# frozen_string_literal: true

require 'dry/validation'

Dry::Validation.load_extensions(:monads)

module Onboarding
  module Endpoints
    module CreateUser
      class Validator < Dry::Validation::Contract
        option :repository

        params do
          required(:name).filled(:string)
          required(:email).filled(:string)
        end

        rule(:email) do
          key.failure('must be unique') if repository.exists?(email: value)
        end
      end
    end
  end
end
