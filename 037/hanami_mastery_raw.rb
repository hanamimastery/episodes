#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './repositories/episodes.rb'
require_relative './transformations/touch.rb'
require_relative './transformations/unshot.rb'

repository = HanamiMastery::Repositories::Episodes.new

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
  processed = cmd.call(content, timestamp: Time.now)
  repository.replace(id, processed)
else
  puts 'Unsupported command.'
end
