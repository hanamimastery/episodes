# frozen_string_literal: true

module Main
  module Serializers
    class User
      include Alba::Resource

      root_key :user, :users

      on_nil { 'guest' }

      attributes :id, :nickname

      attribute :full_name do |resource|
        if resource.last_name && resource.first_name
          [resource.first_name, resource.last_name].join(": ")
        end
      end

      transform_keys :camel
    end
  end
end
