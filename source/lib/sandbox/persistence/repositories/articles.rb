# frozen_string_literal: true

module Sandbox
  module Persistence
    module Repositories
      class Articles < Repository[:articles]
        commands :create

        def all
          articles.combine(:author).to_a
        end

        def find(id)
          articles.combine(:author).by_pk(id).one!
        end
      end
    end
  end
end
