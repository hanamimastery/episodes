# frozen_string_literal: true

module Hanamimastery
  module CLI
    module Entities
      class Episode
        def initialize(content)
          starts_from = content.lines[1..-1].index("---\n") + 2
          @content = content.lines[starts_from..-1].join
        end
        attr_reader :content
      end
    end

    module Repositories
      class Episodes
        REPO_PATH = '/Users/Sebastian/Projects/hanamimastery/source'
        # Reads the episode file content
        #
        def read(id)
          File.read(find(id))
        end

        # Replaces the whole file content with the new content
        #
        def replace(id, new_content)
          File.write(find(id), new_content)
        end

        def exists?(id)
          File.exists?(find(id))
        end

        def fetch(id)
          Entities::Episode.new(read(id))
        end

        private

        def file_name(id)
          episodes.find { |filename| filename.match?(/^#{id.to_i.to_s}-/)}
        end

        def find(id)
          [file_path, file_name(id)].join('/')
        end

        def episodes
          Dir[[file_path, '*'].join('/')].map { |i| i.split('/').last }
        end

        def file_path
          [REPO_PATH, 'data/episodes'].join('/')
        end
      end
    end
  end
end
