# frozen_string_literal: true

module Main
  module Actions
    module Articles
      class Drafts < Main::Action
        include Deps[
          repo: 'persistence.repositories.articles',
        ]

        def handle(_req, res)
          res.headers['Content-Type'] = 'application/json'
          res.body = Serializers::Article.new(repo.drafts).serialize
        end
      end
    end
  end
end
