module Main
  # Configures application routes.
  class Routes < Hanami::Routes
    root to: 'home.dashboard'

    post "/signup", to: "registrations.create", as: :register_account
    get "/signup", to: "registrations.new", as: :signup
  end
end
