# frozen_string_literal: true

require "dry/transformer"

module Interlinker
  module Functions
    extend Dry::Transformer::Registry

    import Dry::Transformer::ArrayTransformations
    import Dry::Transformer::HashTransformations
  end
end
