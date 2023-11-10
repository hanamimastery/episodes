# frozen_string_literal: true

# Does something
#
class Foo
  # Does something cool
  # @param name [Hash] sample argument
  # @return [NilClass]
  #
  def call(name:); end
end

# Does something else
#
class Bar
  # Does something cooler
  # @return [NilClass]
  #
  def call; end
end

Foo.new.call
