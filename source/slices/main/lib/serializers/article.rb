# frozen_string_literal: true

require 'alba'

module Main
  module Serializers
    class Article
      include Alba::Resource

      root_key :article

      attributes :id, :title, :excerpt, :thumbnail, :published_on, :state
    end
  end
end
