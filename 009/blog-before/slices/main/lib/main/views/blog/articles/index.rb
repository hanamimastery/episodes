# frozen_string_literal: true

require 'faker'

module Main
  module Views
    module Blog
      module Articles
        class Index < View::Base
          expose :articles do
            (1..20).map { |i| ::Main::Entities::Article.new(id: i) }
          end
        end
      end
    end
  end
end
