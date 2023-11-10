# frozen_string_literal: true

Hanami.application.register_provider :serializers do
  start do
    require 'alba'

    Alba.backend = :oj
    Alba.enable_inference!(with: :dry)
  end
end
