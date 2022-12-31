#!/usr/bin/env ruby
# frozen_string_literal: true

module HanamiMastery
  module Repositories
    class Episodes
      # Reads the episode file content
      #
      def read(id)
        File.read(file_path(id))
      end

      # Replaces the whole file content with the new content
      #
      def replace(id, new_content)
        File.write(file_path(id), new_content)
      end

      def exists?(id)
        File.exists?(file_path(id))
      end

      private

      def file_path(id)
        "./HME#{'%03d' % id}.md"
      end
    end
  end
end
