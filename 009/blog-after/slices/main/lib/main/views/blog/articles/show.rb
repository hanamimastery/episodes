# frozen_string_literal: true

module Main
  module Views
    module Blog
      module Articles
        class Show < View::Base
          expose :article
        end
      end
    end
  end
end
