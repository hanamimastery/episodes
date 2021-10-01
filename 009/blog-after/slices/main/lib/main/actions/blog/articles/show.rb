# frozen_string_literal: true

module Main
  module Actions
    module Blog
      module Articles
        class Show < Main::Action
          include Deps[
            repo: 'application.persistence.repositories.articles'
          ]

          def handle(req, res)
            article = repo.find(req.params[:id])
            res.render view, article: article
          end
        end
      end
    end
  end
end
