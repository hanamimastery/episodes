# frozen_string_literal: true

require 'faker'

container = Sandbox::Container
rom = container['persistence.rom']
# repo = container['repositories.authors']

authors = rom.relations[:authors]
authors.changeset(:create, { first_name: 'Seb', last_name: 'Wilgosz', nickname: 'swilgosz' }).commit
authors.changeset(:create, { first_name: 'Hanami', last_name: 'Master', nickname: 'hm' }).commit
authors.changeset(:create, { first_name: 'Awesome', last_name: 'Subscriber', nickname: 'awesomesub' }).commit

author_ids = authors.pluck(:id)

puts author_ids

articles = rom.relations[:articles]
20.times do
  articles.changeset(
    :create,
    {
      title: Faker::Hacker.say_something_smart,
      content: Faker::Lorem.sentences(number: 50).join(' '),
      status: 0,
      author_id: author_ids.sample,
      published_on: Time.now
    }
  ).commit
end
