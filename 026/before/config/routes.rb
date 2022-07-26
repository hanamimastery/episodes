# frozen_string_literal: true

require 'hanami/routes'

module Sandbox
  class Routes < Hanami::Routes
    define do
      root { 'Hello from Hanami' }

      get 'messages', to: 'messages.index'
      get 'messages/:id', to: 'messages.show'
    end
  end
end
