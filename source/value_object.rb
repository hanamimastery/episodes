# frozen_string_literal: true

require 'securerandom'
require 'dry-struct'

module Types
  include Dry.Types()
end

class Gender < Dry::Struct
  include Types
  attribute :value, Types::Integer.constrained(gteq: 0, lt: 3)

  def to_i
    value
  end

  def to_s
    case value
    when 0 then 'undefined'
    when 1 then 'male'
    when 2 then 'female'
    end
  end
end

require 'irb'
IRB.start
