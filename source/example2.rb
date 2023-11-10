# frozen_string_literal: true

# Subscribes to the Newsletter
#
class SubscribeToHanamiMasteryNewsletter
  # Subscribes the current reader to the newsletter
  #
  def call; end
end

# Subscribes to the Youtube Channel
#
class SubscribeToHanamiMasteryYoutubeChannel
  # Subscribes the current viewer to the Youtube Channel
  #
  def call; end
end

class Action
  attr_reader :service

  def initialize
    @service = ::SubscribeToHanamiMasteryYoutubeChannel.new
  end

  def call
    service.call
  end
end
