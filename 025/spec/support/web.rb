# frozen_string_literal: true

require 'capybara/rspec'
# require 'hanami/boot'

Capybara.app = Hanami.app
Capybara.server = :puma, { Silent: true }
