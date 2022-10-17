# frozen_string_literal: true

require 'dry/validation'

Dry::Validation.load_extensions(:monads)

module Sandbox
  module Actions
    module CreateArticle
      class Contract < Dry::Validation::Contract
        params do
          required(:title).filled(:string)
          required(:content).filled(:string)
        end
      end
    end
  end
end
