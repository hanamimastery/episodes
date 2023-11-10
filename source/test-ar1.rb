# frozen_string_literal: true

require 'irb'

require 'pg'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'postgres',
  database: 'mydb'
)

# ActiveRecord::Schema.define do
#   create_table :articles do |t|
#     t.string :title
#     t.text :content
#   end
# end

class Article < ActiveRecord::Base
end

IRB.start
