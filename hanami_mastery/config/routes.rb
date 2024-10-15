# frozen_string_literal: true

module HanamiMastery
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    get "/articles", to: "articles.index", as: :articles
    get "/articles/:id", to: "articles.show", as: :article
    get "/articles/new", to: "articles.new", as: :new_article
    post "/articles", to: "articles.create", as: :create_article
    delete "/articles/:id", to: "articles.destroy", as: :destroy_article
  end
end
