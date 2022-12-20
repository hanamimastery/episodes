# frozen_string_literal: true

module Admin
  module Actions
    module Books
      class Unsubscribe < Admin::Action
        include Deps[
          'subscriptions.interactors.unsubscribe'
        ]

        def handle(*, response)
          response.body = unsubscribe.class.name
        end
      end
    end
  end
end
