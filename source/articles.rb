# frozen_string_literal: true

Article = Struct.new(:title)

module Main
  module Views
    module Blog
      class Articles < View::Base
        expose :articles do
          ['Article 1', 'Article 2', 'Article 3'].map do |a|
            Article.new(a)
          end
        end
      end
    end
  end
end
