# Seed data for the application
#
# The command `bin/hanami db seed` executes these seeds

require 'faker'

authors = Main::Container[
  'application.persistence.repositories.authors'
]

authors.create(first_name: 'Seb', last_name: 'Wilgosz')
authors.create(first_name: 'Hanami', last_name: 'Master')
authors.create(first_name: 'Awesome', last_name: 'Subscriber')

author_ids = authors.all.to_a.map(&:id)

articles = Main::Container[
  'application.persistence.repositories.articles'
]

20.times do |i|
  articles.create(
    title: Faker::Hacker.say_something_smart,
    excerpt: Faker::Lorem.paragraph(random_sentences_to_add: 4),
    content: Faker::Lorem.sentences(number: 50).join(' '),
    thumbnail: "https://loremflickr.com/800/460/cat?lock=#{i}",
    author_id: author_ids.sample,
    published_on: "1 Apr 2021"
  )
end
