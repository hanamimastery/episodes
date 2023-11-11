#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optionparser'

require_relative './repositories/episodes.rb'
require_relative './transformations/touch.rb'
require_relative './transformations/unshot.rb'

SUPPORTED_COMMANDS = %w[touch, unshot]
repository = HanamiMastery::Repositories::Episodes.new

options = {
  timestamp: Time.now
}

opt_parser = OptionParser.new do |opts|
  opts.on('--timestamp=TIMESTAMP') do |timestamp|
    options[:timestamp] = timestamp
  end

  opts.on('-h', '--help', 'Prints this help') do
    puts <<~STRING
      Usage: #{__FILE__} command [options]
      Available commands: #{SUPPORTED_COMMANDS}
      STRING
    exit
  end
end

opt_parser.parse! # cleans ARGV from options args
command = ARGV.shift

case command
when 'unshot'
  id = ARGV.shift
  content = repository.read(id)
  cmd = HanamiMastery::Transformations::Unshot.new
  processed = cmd.call(content)
  repository.replace(id, processed)
when 'touch'
  id = ARGV.shift
  content = repository.read(id)
  cmd = HanamiMastery::Transformations::Touch.new
  processed = cmd.call(content, timestamp: options[:timestamp])
  repository.replace(id, processed)
else
  puts 'Unsupported command.'
end
