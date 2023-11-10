# frozen_string_literal: true

require 'bundler/setup'
require 'irb'
require 'dry-validation'

Dry::Validation.register_macro(:email_format) do
  email_reg = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  key.failure('not a valid email format') unless email_reg.match?(value)
end

class HanamiMasterySubscriptionContract < ApplicationContract
  params do
    required(:email).filled(:string)
  end

  rule(:email).validate(:email_format)
end

IRB.start
