# frozen_string_literal: true

require 'faker'

container = Sandbox::Container
authors = container['repositories.authors']

data = { first_name: 'Seb', last_name: 'Wilgosz', nickname: 'swilgosz' }
authors.create(data)

data = { first_name: 'Hanami', last_name: 'Master', nickname: 'hm' }
authors.create(data)

data = { first_name: 'Awesome', last_name: 'Subscriber', nickname: 'awesomesub' }
authors.create(data)

author_ids = authors.all.pluck(:id)

puts author_ids

articles = container['repositories.articles']

2.times do
  articles.create(
    title: Faker::Hacker.say_something_smart,
    content: Faker::Lorem.sentences(number: 50).join(' '),
    status: 0,
    author_id: author_ids.sample,
    published_on: Time.now
  )
end

events = container['repositories.events']

articles.all.each do |article|
  events.create(
    type: 'article_published',
    data: {
      article_id: article.id,
      published_at:  Time.now.iso8601,
      published_by: 1
    },
    metadata: {
      created_at: Time.now.iso8601
    }
  )
end

authors.all.each do |author|
  events.create(
    type: 'author_registered',
    data: {
      author_id: author.id,
      first_name: author.first_name,
      last_name: author.last_name,
      nickname: author.nickname
    },
    metadata: {
      created_at: Time.now.iso8601
    }
  )
end
