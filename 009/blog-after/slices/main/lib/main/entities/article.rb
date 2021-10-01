# frozen_string_literal: true

require 'faker'

module Main
  module Entities
    class Article
      attr_reader(
        :title,
        :excerpt,
        :author,
        :content,
        :thumbnail,
        :id,
        :published_on
      )

      def initialize(args = {})
        @id = args[:id] || 1
        @title = Faker::Hacker.say_something_smart
        @excerpt =
          Faker::Lorem.paragraph(random_sentences_to_add: 4)
        @content =
          Faker::Lorem.sentences(number: 50).join(' ')
        @thumbnail =
          "https://loremflickr.com/800/460/cat?lock=#{id}"
        @author = Author.new
        @published_on = "1 Jan 2016"
      end
    end
  end
end
