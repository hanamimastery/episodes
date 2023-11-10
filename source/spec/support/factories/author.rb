# frozen_string_literal: true

Factory.define(:author, struct_namespace: Sandbox::Entities) do |f|
  f.first_name Faker::Name.first_name
  f.last_name Faker::Name.last_name
  f.nickname { Faker::Internet.unique.username }
end
