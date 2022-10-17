# frozen_string_literal: true

require 'dry/monads/result'

module Sandbox
  module Actions
    module CreateArticle
      class Authorizer
        include Dry::Monads[:result]

        def call(_model, auth)
          auth.length.zero? ? Failure(:authorize) : Success()
        end
      end
    end
  end
end
