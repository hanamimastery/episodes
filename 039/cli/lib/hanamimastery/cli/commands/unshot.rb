# frozen_string_literal: true

module Hanamimastery
  module CLI
    module Commands
      class Unshot < Dry::CLI::Command
        desc 'Removes shot marks from a given article (i.e. ""[🎬 01] ")'

        argument :episode, type: :integer, required: true, desc: "Episodes ID to unshot"

        include Deps[
          repository: 'repositories.episodes',
          transformation: 'hanamimasterytransformations.unshot'
        ]

        attr_reader :transformation, :repository

        def call(episode:, **)
          content = repository.read(episode)
          processed = transformation.call(content, one: false)
          repository.replace(episode, processed)
        end
      end
    end
  end
end
