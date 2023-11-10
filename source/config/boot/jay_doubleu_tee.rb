# frozen_string_literal: true

Hanami.application.register_bootable :jay_doubleu_tee do |container|
  init do
    require 'jay_doubleu_tee'
  end

  start do
    JayDoubleuTee.configure do |config|
      config.algorithm = 'RS256'
      config.secret = container[:settings].jwt_public_key
    end
  end
end
