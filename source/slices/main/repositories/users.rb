# frozen_string_literal: true

# /lib/sandbox/persistence/repositories/articles.rb

module Main
  module Repositories
    class Users < Repository[:users]
      commands :create, :delete

      def all
        users.to_a
      end

      def find(id)
        users.by_pk(id).one!
      end
    end
  end
end
