# frozen_string_literal: true

require 'dry/types'

module Sandbox
  module Actions
    module Articles
      class Publish < Patch
        include Deps[interactor: 'interactors.articles.publish']

        params do
          required(:id).value(Types::Coercible::Integer)
        end

        def handle(_req, res)
          res[:result] = interactor.call(res.params)
        end
      end
    end
  end
end
