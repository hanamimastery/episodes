# frozen_string_literal: true

require 'hanami/application/routes'

module Sandbox
  class Routes < Hanami::Application::Routes
    define do
      slice :main, at: '/' do
        root to: 'home.show'

        get '/articles', to: 'articles.published'
        get '/articles/drafts', to: 'articles.drafts'
      end
    end
  end
end
