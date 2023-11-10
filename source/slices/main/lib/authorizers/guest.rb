# frozen_string_literal: true

module Main
  module Authorizers
    class Guest
      def call(auth:, **)
        return false unless auth.success?

        auth.value!['scopes'].include?('public.articles')
      end
    end
  end
end
