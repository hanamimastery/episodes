# frozen_string_literal: true

require 'dry-configurable'

class App
  include Dry::Configurable

  setting :api_url
end

require 'irb'
IRB.start
