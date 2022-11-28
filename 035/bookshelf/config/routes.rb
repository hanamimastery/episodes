# frozen_string_literal: true

module Bookshelf
  class Routes < Hanami::Routes
    root { "Hello from Hanami" }
    get "/books/:id", to: "books.show"
  end
end
