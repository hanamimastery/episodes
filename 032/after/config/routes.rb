# frozen_string_literal: true

module Sandbox
  class Routes < Hanami::Routes
    root { "Hello from Hanami" }
    get '/articles', to: 'articles.index'
    patch '/articles/:id/publish', to: 'articles.publish'
  end
end