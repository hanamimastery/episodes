# frozen_string_literal: true

module Main
  module Views
    module Blog
      module Articles
        class Index < View::Base
          expose :articles
        end
      end
    end
  end
end
