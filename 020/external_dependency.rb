# frozen_string_literal: true

require 'bundler/setup'
require 'irb'
require 'dry-validation'

class Repo
  def exists?(email)
    true
  end
end

class HanamiMasterySubscriptionContract < Dry::Validation::Contract
  option :repo

  params do
    required(:email).filled(:string)
  end

  rule(:email) do
    if repo.exists?(values[:email])
      key.failure("I appreciate you want to subscribe but we don't want to spam you")
    end
  end
end

contract = HanamiMasterySubscriptionContract.new(repo: Repo.new)
result = contract.call(email: 'awesomesubscriber@hanamimastery.com')


IRB.start
