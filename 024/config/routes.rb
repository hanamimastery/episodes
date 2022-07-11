# frozen_string_literal: true

module Sandbox
  class Routes < Hanami::Routes
    define do
      root to: 'home.show'
    end
  end
end
