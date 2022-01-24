# frozen_string_literal: true

module Main
  module Repositories
    class Articles < Repository[:articles]
      commands :create

      def all
        with_author.to_a
      end

      def drafts
        with_author.where(state: 'draft')
      end

      def published
        with_author.where(state: 'published')
      end

      def find(id)
        articles.combine(:author).by_pk(id).one!
      end

      private

      def with_author
        articles.combine(:author)
      end
    end
  end
end
