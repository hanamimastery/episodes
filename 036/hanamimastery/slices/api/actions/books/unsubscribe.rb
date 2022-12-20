# frozen_string_literal: true

module API
  module Actions
    module Books
      class Unsubscribe < API::Action
        include Deps[
          'subscribing.interactors.unsubscribe'
        ]

        def handle(*, response)
          response.body = unsubscribe.class.name
        end
      end
    end
  end
end
