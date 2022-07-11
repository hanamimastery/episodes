# frozen_string_literal: true

module Main
  module Actions
    module Users
      class Index < Action::Base
        include Deps[
          repo: 'repositories.users'
        ]

        def handle(_req, res)
          res.body =
            Serializers::User.new(repo.all).serialize
        end
      end
    end
  end
end
