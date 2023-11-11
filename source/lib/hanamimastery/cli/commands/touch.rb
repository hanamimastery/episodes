# frozen_string_literal: true

require 'time'

module Hanamimastery
  module CLI
    module Commands
      class Touch < Dry::CLI::Command
        desc 'Updates the modifiedAt with the current date'
        argument :episode, type: :integer, required: :true, desc: "Episode's ID to touch"
        option :timestamp, type: :string, default: Time.now.to_s, desc: 'Override modified time'

        include Deps[
          repository: 'repositories.episodes',
          transformation: 'transformations.touch'
        ]

        def call(episode:, timestamp:, **)
          timestamp = Time.parse(timestamp)
          content = repository.read(episode)
          processed =
            transformation.call(
              content, timestamp: timestamp
            )
          repository.replace(episode, processed)
        end
      end
    end
  end
end
