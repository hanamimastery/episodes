# frozen_string_literal: true

module Main
  module Entities
    class Article
      attr_accessor :title, :excerpt, :author, :content, :thumbnail, :id, :published_on

      def initialize(args = {})
        self.id = args[:id] || 1
        self.title = args[:title] || Faker::Hacker.say_something_smart
        self.excerpt = args[:excerpt] || Faker::Lorem.paragraph(random_sentences_to_add: 4)
        self.content = args[:content] || Faker::Lorem.sentences(number: 50).join(' ')
        self.thumbnail = args[:thumbnail] || "https://loremflickr.com/800/460/cat?lock=#{id}"
        self.author = Author.new
        self.published_on = "1 Jan 2016"
      end
    end
  end
end
