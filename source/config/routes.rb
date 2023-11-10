# frozen_string_literal: true

Hanami.application.routes do
  slice :main, at: '/' do
    root to: 'home.show'

    get '/articles', to: 'blog.articles'
  end
end
