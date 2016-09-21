require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) {Hand.new}

  describe '#initialize' do
    it "should have 5 cards" do
      expect(hand.draws.length).to eq(5)
    end
  end
end
