# frozen_string_literal: true

module Sandbox
  module Utils
    module Paginable
      DEFAULT_PAGE = 1
      DEFAULT_SIZE = 10

      PaginationSchema = Dry::Schema.Params do
        optional(:page).filled(Types::Coercible::Integer.default(DEFAULT_PAGE), gteq?: 1)
        optional(:per_page).
          filled(Types::Coercible::Integer.default(DEFAULT_SIZE), gteq?: 1, lteq?: 50)
      end

      def paginate(relation, params)
        result = validate_pagination(params.to_h)
        relation.
          per_page(result[:per_page]).
          page(result[:page])
      end

      def validate_pagination(params)
        result = PaginationSchema.call(params)
        return result if result.success?

        halt 400, result.errors.to_h.to_json
      end
    end
  end
end
