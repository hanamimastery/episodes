# frozen_string_literal: true

module Sandbox
  module Actions
    module Articles
      class Index < Get
        include Deps[repo: 'repositories.articles']

        def handle(_req, res)
          res.status = 200
          relation = repo.articles_with_authors
          res.body = serialize(relation)
        end
      end
    end
  end
end
