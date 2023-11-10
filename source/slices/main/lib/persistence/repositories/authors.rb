# frozen_string_literal: true

module Main
  module Persistence
    module Repositories
      class Authors < Repository[:authors]
        commands :create

        def all
          authors.to_a
        end
      end
    end
  end
end
