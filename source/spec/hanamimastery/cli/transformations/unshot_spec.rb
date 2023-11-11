# frozen_string_literal: true

RSpec.describe Hanamimastery::CLI::Transformations::Unshot do
  let(:subject) { described_class.new }

  describe '#call' do
    let(:expected) { "before after at the end" }

    it 'removes shot marks with normal space from content' do
      content = "before [🎬 02] after [🎬 02] at the end"
      actual = subject.call(content)
      expect(actual).to eq(expected)
    end

    it 'removes shot marks with non-breaking space from content' do
      content = "before [🎬 02] after [🎬 02] at the end"
      actual = subject.call(content)
      expect(actual).to eq(expected)
    end
  end
end
