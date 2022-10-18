# frozen_string_literal: true

require 'dry/types'

module Sandbox
  module Actions
    module Articles
      class Publish < Action
        include Deps[interactor: 'interactors.articles.publish']

        def handle(_req, res)
          interactor.call(res.params)
        end
      end
    end
  end
end
