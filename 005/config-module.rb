# frozen_string_literal: true

require 'dry-configurable'

module App
  extend Dry::Configurable

  setting :api_url
end

require 'irb'
IRB.start
