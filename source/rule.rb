# frozen_string_literal: true

require 'bundler/setup'
require 'irb'
require 'dry-validation'

class ReservationContract < Dry::Validation::Contract
  params do
    required(:from).value(:date)
    required(:to).value(:date)
  end

  rule(:from, :to) do
    key.failure('must be after start date') if values[:to] <= values[:from]
  end
end

contract = ReservationContract.new
result = contract.call(from: Date.today, to: Date.today - 1)

IRB.start
