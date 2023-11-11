# frozen_string_literal: true

RSpec.describe Hanamimastery::CLI::Transformations::ToPRO do
  let(:content) do
    <<~STRING
      paragraph 1

      paragraph 2

      # Level 1 header
      # Level 2 Header
      # Level 3 Header

      ![Sample Image](/images/episodes/34/sample-image.png)

      :::call to action 1
      sample content inside
      - with line items
      <>
      :::
    STRING
  end

  let(:expected) do
    <<~STRING
    <p>paragraph 1</p>
    <p>paragraph 2</p>
    <h1><a href="#level-1-header" aria-hidden="true" class="anchor" id="level-1-header"></a>Level 1 header</h1>
    <h1><a href="#level-2-header" aria-hidden="true" class="anchor" id="level-2-header"></a>Level 2 Header</h1>
    <h1><a href="#level-3-header" aria-hidden="true" class="anchor" id="level-3-header"></a>Level 3 Header</h1>
    <p><img src="https://hanamimastery.com/images/episodes/34/sample-image.png" alt="Sample Image" /></p>
    STRING
  end

  describe '#call' do
    subject { described_class.new }
    it 'renders proper HTML' do
      actual = subject.call(content)
      expect(actual).to eq(expected)
    end
  end
end
