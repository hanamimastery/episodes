# frozen_string_literal: true

require 'dry-transformer'

hash = {
  'watcher' => 'John',
  'city' => 'NY',
  'zip' => { 'number' => 1234 }
}

class HanamiMasteryAdapter < Dry::Transformer::Pipe
  import Dry::Transformer::HashTransformations

  define! do
    deep_symbolize_keys
    nest :address, %i[city zip]
    rename_keys watcher: :subscriber
  end
end

adapter = HanamiMasteryAdapter.new
puts adapter.call(hash)
