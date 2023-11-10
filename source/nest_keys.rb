# frozen_string_literal: true

def nest(hash)
  hash.transform_keys(&:to_sym).each_with_object({}) do |(k, v), r|
    if %i[city zip].include?(k.to_sym)
      r[:address] ||= {}
      r[:address][k] = v
    else
      r[k] = v
    end
  end
end

hash = { 'name' => 'John', 'city' => 'NY', 'zip' => '1234' }

puts nest(hash)
