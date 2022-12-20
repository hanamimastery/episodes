# frozen_string_literal: true

module Hanamimastery
  class Routes < Hanami::Routes
    slice :api, at: "/api" do
      post "/books/subscribe", to: "books.subscribe"
      delete "/books/unsubscribe", to: "books.unsubscribe"
      get "/books", to: "books.index"
    end

    slice :admin, at: "/admin" do
      delete "/books/unsubscribe", to: "books.unsubscribe"
    end

    slice :main, at: "/" do
      get "/", to: "books.index"
    end

    slice :subscribing, at: "/subscribing" do
    end
  end
end
