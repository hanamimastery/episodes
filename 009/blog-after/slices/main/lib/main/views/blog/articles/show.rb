# frozen_string_literal: true

module Main
  module Views
    module Blog
      module Articles
        class Show < View::Base
          expose :article do
            ::Main::Entities::Article.new
          end
        end
      end
    end
  end
end
