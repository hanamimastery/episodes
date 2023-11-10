# frozen_string_literal: true

module Main
  module Actions
    module Articles
      class Drafts < Main::Action
        include Deps[
          repo: 'application.persistence.repositories.articles'
        ]

        def handle(_req, res)
          res.render view, articles: repo.drafts
        end
      end
    end
  end
end
