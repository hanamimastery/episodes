module Main
  # Configures application routes.
  class Routes < Hanami::Routes
    root to: 'home.dashboard'
  end
end
