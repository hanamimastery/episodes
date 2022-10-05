# frozen_string_literal: true

module Sandbox
  module Repositories
    class Articles < Repository[:articles]
      def articles_with_authors
        articles.combine(:author)
      end
    end
  end
end
