# frozen_string_literal: true

module Sandbox
  module Actions
    module Articles
      class Index < Get
        include Deps[repo: 'repositories.articles']

        include Utils::Paginable

        def handle(req, res)
          res.status = 200
          relation = repo.articles_with_authors
          paginated = paginate(relation, req.params)
          res.body = serialize(paginated)
        end
      end
    end
  end
end
