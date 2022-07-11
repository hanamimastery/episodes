# frozen_string_literal: true

module Main
  module Actions
    module Articles
      class Published < Main::Action
        include Deps[
          repo: 'application.persistence.repositories.articles'
        ]

        def handle(_req, res)
          res.render view, articles: repo.published
        end
      end
    end
  end
end
