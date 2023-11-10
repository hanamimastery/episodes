# frozen_string_literal: true

module Bookshelf
  module Repositories
    class Books
      def find(id)
        return nil if id > 5

        {
          id: id,
          title: 'How subscribing to Hanami Mastery changed my life',
          author: 'Awesome Subscriber'
        }
      end
    end
  end
end
