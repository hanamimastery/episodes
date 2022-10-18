# frozen_string_literal: true

module Sandbox
  module Actions
    module CreateArticle
      class Action < Post
        include Deps[
          validator: 'actions.create_article.contract',
          interactor: 'interactors.articles.create'
        ]
      end
    end
  end
end
