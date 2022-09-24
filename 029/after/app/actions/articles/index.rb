# frozen_string_literal: true

module Sandbox
  module Actions
    module Articles
      class Index < Action
        include Deps[repo: 'repositories.articles']

        def handle(_req, res)
          res.status = 200
          relation = repo.articles_with_authors
          res.body = serialize(relation)
        end

        private

        def serialize(collection)
          collection.map(&:to_h).to_json
        end
      end
    end
  end
end
