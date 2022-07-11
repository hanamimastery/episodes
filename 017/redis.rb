# frozen_string_literal: true

key_id = 'my_sample_key'
version = 1

redis.eval(
  %(
    if redis.call("get",KEYS[1]) == ARGV[1]
    then
        return redis.call("del",KEYS[1])
    else
        return 0
    end
  ), keys: [key_id], argv: [version]
)
