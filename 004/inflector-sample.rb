#!/usr/bin/env ruby

require 'dry-inflector'
inflector = Dry::Inflector.new

pp "Pluralize: book => #{inflector.pluralize('book')}" # => "books"
pp "Singularize: books => #{inflector.singularize('books')}"    # => "books"

pp "camelize: 'dry/inflector' => #{inflector.camelize('dry/inflector')}"
pp "classify: 'books' => #{inflector.classify('books')}"
pp "tableize: 'Book' => #{inflector.tableize('Book')}"

pp "dasherize: 'dry_inflector' => #{inflector.dasherize('dry_inflector')}"
pp "underscore: 'dry-inflector' => #{inflector.underscore('dry-inflector')}"

pp "demodulize: 'Dry::Inflector' => #{inflector.demodulize('Dry::Inflector')}"

pp "humanize: 'dry_inflector' => #{inflector.humanize('dry_inflector')}"
pp "humanize: 'author_id' => #{inflector.humanize('author_id')}"

pp "ordinalize: 1 => #{inflector.ordinalize(1)}"
pp "ordinalize: 2 => #{inflector.ordinalize(2)}"
pp "ordinalize: 3 => #{inflector.ordinalize(3)}"
pp "ordinalize: 10 => #{inflector.ordinalize(10)}"
pp "ordinalize: 23 => #{inflector.ordinalize(23)}"

inflector = Dry::Inflector.new do |inflections|
  inflections.acronym 'API', 'JSON'
end

pp inflector.underscore('JSONAPIResponse')
pp inflector.camelize('json_api_response')
