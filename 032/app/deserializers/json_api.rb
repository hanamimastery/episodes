require 'dry/types'
require 'dry-monads'

module Types
  include Dry.Types()
end

module Sandbox
  module Deserializers
    class JSONAPI
      include Dry::Monads[:result]

      Schema = Dry::Schema.Params do
        required(:type).filled(Types::Coercible::String)
        required(:data).hash
      end

      def call(params)
        result = Schema.call(params)
        return Success(result.to_h[:data]) if result.success?

        Failure(result.errors.to_h)
      end
    end
  end
end
