# frozen_string_literal: true

module HanamiMastery
  module Actions
    module Articles
      class Destroy < HanamiMastery::Action
        include Deps[repo: 'repos.article_repo']

        params do
          required(:id).filled(:integer)
        end

        def handle(request, response)
          halt 404 unless request.params.valid?

          repo.delete(request.params[:id])
          response.redirect(routes.path(:articles))
        end
      end
    end
  end
end
