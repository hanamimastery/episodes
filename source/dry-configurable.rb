# frozen_string_literal: true

require 'dry-configurable'
require 'uri'

class App
  extend Dry::Configurable

  setting :adapter

  setting :enabled, false, reader: true

  setting :repository, reader: true do
    setting :type, :local
    setting :encryption do
      setting :cipher, 'aes-256-cbc'
    end
  end

  setting(:url, 'https://hanamimastery.com') { |value| URI(value) }
end

require 'irb'
IRB.start
