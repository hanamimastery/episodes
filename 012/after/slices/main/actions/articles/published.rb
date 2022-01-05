# frozen_string_literal: true

module Main
  module Actions
    module Articles
      class Published < Main::Action
        include Deps[
          repo: 'persistence.repositories.articles',
          authorizer: 'authorizers.guest'
        ]

        include JayDoubleuTee::Auth

        def handle(req, res)
          res.headers['Content-Type'] = 'application/json'

          if authorizer.call(auth: auth)
            res.body = Serializers::Article.new(repo.published).serialize
          else
            res.body = { error: 'Forbidden request' }
            res.status = 403
          end
        end
      end
    end
  end
end
