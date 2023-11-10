# frozen_string_literal: true

require 'pathname'
SPEC_ROOT = Pathname(__dir__).realpath.freeze

if ENV['SIMPLECOV']
  require 'simplecov'
  SimpleCov.start do
    enable_coverage :branch
    primary_coverage :branch
    add_filter %r{^/spec/}
    add_group 'Admin', 'slices/admin'
    add_group 'Reporting', 'slices/reporting'
    add_group 'Monitoring', 'slices/monitoring'
    add_group 'Core', 'app'

    minimum_coverage line: 90, branch: 80
    refuse_coverage_drop :line, :branch
  end
end

require 'hanami/prepare'

require_relative 'support/rspec'
require_relative 'support/web'
