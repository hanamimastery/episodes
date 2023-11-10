# frozen_string_literal: true

def deserialize(hash)
  hash.transform_keys(&:to_sym)
end

hash = {
  'name' => 'John',
  'city' => 'NY',
  'zip' => { 'number' => '1234' }
}

puts deserialize(hash)
