# frozen_string_literal: true

module Main
  module Actions
    module Users
      class Show < Action::Base
        include Deps[
          repo: 'repositories.users'
        ]

        params do
          required(:id).value(:integer)
        end

        def handle(req, res)
          user = repo.find(req.params[:id])
          res.body =
            Alba.serialize(user) do
              attributes :id, :first_name, :last_name
              root_key :user, :users
            end
        end
      end
    end
  end
end
