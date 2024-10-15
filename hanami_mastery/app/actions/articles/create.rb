# frozen_string_literal: true

module HanamiMastery
  module Actions
    module Articles
      class Create < HanamiMastery::Action
        include Deps[repo: "repos.article_repo"]
        params do
          required(:article).schema do
            required(:title).filled(:string)
            required(:content).filled(:string)
          end
        end

        def handle(request, response)
          halt 422 unless request.params.valid?

          repo.create(request.params[:article])
          response.redirect(routes.path(:articles))
        end
      end
    end
  end
end
