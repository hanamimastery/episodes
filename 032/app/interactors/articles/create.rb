# frozen_string_literal: true

require "dry/monads"
require "dry/matcher/result_matcher"

module Sandbox
  module Interactors
    module Articles
      class Create
        include Dry::Monads[:do, :result]
        include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)
        include Dry::Effects.CurrentTime

        include Deps[repo: 'repositories.articles']

        def call(input)
          attrs = yield validate(input)
          create(attrs)
        end

        private

        def validate(input)
          Success(input)
        end

        def create(attrs)
          repo.create(
            attrs.merge(
              published_on: current_time.to_date,
              updated_at: current_time
            )
          )
          Success(:create)
        rescue StandardError => e
          Failure[:database_error, e]
        end
      end
    end
  end
end
