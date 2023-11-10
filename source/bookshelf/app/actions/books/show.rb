# frozen_string_literal: true

module Bookshelf
  module Actions
    module Books
      class Show < Bookshelf::Action
        include Deps['repositories.books']

        def handle(req, res)
          book = books.find(req.params[:id])
          res.body = serialize(book)
        end

        private

        def serialize(entity)
          entity.to_h.to_json
        end
      end
    end
  end
end
