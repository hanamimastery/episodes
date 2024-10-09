# frozen_string_literal: true

require "hanami/db/repo"

module Hanamimastery
  module DB
    class Repo < Hanami::DB::Repo
      auto_struct true

      commands :create, update: :by_pk

      def multi_insert(array)
        root.command(:create, result: :many).call(array)
      end

      def all
        default_scope.to_a
      end

      def find(id)
        root.by_pk(id).one!
      end

      private

      def default_scope
        root
      end
    end
  end
end
