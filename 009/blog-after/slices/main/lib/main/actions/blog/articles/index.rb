# frozen_string_literal: true

module Main
  module Actions
    module Blog
      module Articles
        class Index < Main::Action
          include Deps[
            repo: 'application.persistence.repositories.articles'
          ]

          def handle(req, res)
            res.render view, articles: repo.all
          end
        end
      end
    end
  end
end
