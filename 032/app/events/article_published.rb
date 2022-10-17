# frozen_string_literal: true

module Sandbox
  module Events
    class ArticlePublished < Event
      attribute :article_id, Types::Integer
      attribute :published_by, Types::Integer
    end
  end
end
