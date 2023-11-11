# frozen_string_literal: true

module API
  module Actions
    module Books
      class Subscribe < API::Action
        include Deps[
          'subscribing.interactors.subscribe'
        ]

        def handle(*, response)
          response.body = subscribe.class.name
        end
      end
    end
  end
end
