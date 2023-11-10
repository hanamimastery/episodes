# frozen_string_literal: true

module Bookshelf
  module Actions
    module Books
      class Show < Bookshelf::Action
        include Deps['repositories.books']

        params do
          required(:id).filled(:integer, gteq?: 0)
        end

        def handle(req, res)
          params = req.params
          halt 422, params.errors.to_h.to_json unless params.valid?

          book = books.find(req.params[:id])
          halt 404 unless book
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
