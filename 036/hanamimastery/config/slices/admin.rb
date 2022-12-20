# frozen_string_literal: true

module Admin
  class Slice < Hanami::Slice
    import keys: ['interactors.unsubscribe'], from: :subscribing, as: :subscriptions
  end
end
