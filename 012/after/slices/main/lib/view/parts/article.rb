# frozen_string_literal: true

module Main
  module View
    module Parts
      class Article < Hanami::View::Part
        def by
          author_name = [value.author.first_name, value.author.last_name].join(' ')
          "by <a href='https://twitter.com/sebwilgosz'>#{author_name}</a> "
        end
      end
    end
  end
end
