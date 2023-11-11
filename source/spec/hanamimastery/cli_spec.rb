# frozen_string_literal: true

RSpec.describe Hanamimastery::CLI do
  it "has a version number" do
    expect(Hanamimastery::CLI::VERSION).not_to be nil
  end
end
