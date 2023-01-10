#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './repositories/episodes.rb'
require_relative './transformations/touch.rb'
require_relative './transformations/unshot.rb'

require "bundler/setup"
require "time"
require "dry/cli"

module HanamiMastery
  module CLI
    extend Dry::CLI::Registry

    class Touch < Dry::CLI::Command
      desc 'Updates the modifiedAt with the current date'

      argument :episode, type: :integer, required: true, desc: "Episodes ID to touch"
      option :timestamp, type: :time, default: Time.now, desc: "Graceful stop"

      def initialize
        @repository = Repositories::Episodes.new
        @transformation = Transformations::Touch.new
      end

      attr_reader :transformation, :repository

      def call(episode:, timestamp:, **)
        timestamp = Time.parse(timestamp.to_s)
        content = repository.read(episode)
        processed = transformation.call(content, timestamp: timestamp)
        repository.replace(episode, processed)
      end
    end

    class Unshot < Dry::CLI::Command
      desc 'Removes shot marks from a given article [🎬 01]'

      argument :episode, type: :integer, required: true, desc: "Episodes ID to unshot"

      def initialize
        @repository = HanamiMastery::Repositories::Episodes.new
        @transformation = Transformations::Unshot.new
      end

      attr_reader :transformation, :repository

      def call(episode:, **)
        content = repository.read(episode)
        processed = transformation.call(content, one: false)
        repository.replace(episode, processed)
      end
    end

    register "modify", aliases: ["m"] do |prefix|
      prefix.register "unshot", Unshot
      prefix.register "touch", Touch
    end
  end
end

Dry::CLI.new(HanamiMastery::CLI).call
