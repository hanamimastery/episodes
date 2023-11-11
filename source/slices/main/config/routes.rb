# frozen_string_literal: true

module Main
  class Routes < Hanami::Routes
    root to: "home.show"
    post "/subscribe", to: "home.subscribe"

    get "/contact", to: "contact.show", as: :contact
    post "/contact", to: "contact.send", as: :contact
  end
end
