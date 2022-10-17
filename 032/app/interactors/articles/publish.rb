# frozen_string_literal: true

require "dry/monads"
require "dry/matcher/result_matcher"

module Sandbox
  module Interactors
    module Articles
      class Publish
        include Dry::Monads[:do, :result]
        include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)
        include Dry::Effects.CurrentTime

        include Deps[repo: 'repositories.articles']

        def call(id)
          article = yield find(id)
          publish(article)
        end

        private

        def find(id)
          Success(repo.articles.where(id: id).one!)
        rescue ROM::TupleCountMismatchError
          Failure[:not_found, id: id]
        end

        def publish(article)
          return Success(:not_modified) if article.published?

          repo.update(
            article.id,
            published_on: current_time.to_date,
            updated_at: current_time
          )
          Success(:ok)
        rescue StandardError => e
          Failure[:publication_error, e]
        end
      end
    end
  end
end
