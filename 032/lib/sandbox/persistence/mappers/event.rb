# frozen_string_literal: true

require 'rom/transformer'

module Sandbox
  module Persistence
    module Mappers
      class Event < ROM::Transformer
        relation :events, as: :event_mapper

        map do
          symbolize_keys
          resolve_type
          instantiate
        end

        def resolve_type(row)
          inflector = ROM::Inflector
          event_klass_name = "Sandbox::Events::#{inflector.classify(row[:type])}"
          [inflector.constantize(event_klass_name), row]
        end

        def instantiate(input)
          event_klass, row = input
          metadata =
            (row[:metadata] || {}).
              merge(event_type: row[:type])
          event_klass.new(
            id: row[:id],
            metadata: metadata,
            **row[:data]
          )
        end
      end
    end
  end
end
