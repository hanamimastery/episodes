# frozen_string_literal: true

require "hanami/application/routes"

module Interlinker
  class Routes < Hanami::Application::Routes
    define do
      slice :main, at: "/" do
        root to: "home.show"
        get '/users/:id', to: 'users.show'
        get '/users', to: 'users.index'
      end
    end
  end
end
