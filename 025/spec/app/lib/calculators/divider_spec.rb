# frozen_string_literal: true

RSpec.describe Sandbox::Calculators::Divider do
  describe '#call' do
    it 'works' do
      expect(subject.call(4, 2)).to eq(2)
    end

    it 'returns info when dividing by 0' do
      expect(subject.call(4, 0)).to eq("Can't divide by 0")
    end
  end
end
