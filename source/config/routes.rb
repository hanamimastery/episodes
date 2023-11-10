# frozen_string_literal: true

module Sandbox
  class Routes < Hanami::Routes
    define do
      root { "Hello from Hanami" }
      get '/articles', to: 'articles.index'
    end
  end
end
