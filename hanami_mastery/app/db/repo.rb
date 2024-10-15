# frozen_string_literal: true

require "hanami/db/repo"

module HanamiMastery
  module DB
    class Repo < Hanami::DB::Repo
      commands :create, update: :by_pk, delete: :by_pk

      def all
        default_scope.to_a
      end

      def find(id)
        default_scope.by_pk(id).one!
      end

      private

      def default_scope
        root
      end
    end
  end
end
