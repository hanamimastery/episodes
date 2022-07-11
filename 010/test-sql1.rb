# frozen_string_literal: true

require 'irb'

require 'pg'
require 'sequel'

DB = Sequel.connect(
  adapter: 'postgresql',
  database: 'mydb'
)

class Article < Sequel::Model
end

IRB.start
