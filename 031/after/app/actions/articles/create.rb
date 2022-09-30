# frozen_string_literal: true

require 'dry/types'

module Sandbox
  module Actions
    module Articles
      class Publish < Action
        include Deps[interactor: 'interactors.articles.publish']

        params do
          required(:id).value(Dry::Types::Coercible::Integer)
        end

        def handle(_req, res)
          interactor.call(res.params)
        end

        private

        def serialize(collection)
          collection.map(&:to_h).to_json
        end
      end
    end
  end
end
