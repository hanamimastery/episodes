# frozen_string_literal: true

module Main
  module Actions
    module Articles
      class Published < Main::Action
        include Deps[
          repo: 'persistence.repositories.articles'
        ]

        def handle(req, res)
          res.headers['Content-Type'] = 'application/json'
          res.body = Serializers::Article.new(repo.published).serialize
        end
      end
    end
  end
end
