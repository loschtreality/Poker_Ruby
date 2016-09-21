require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "should have 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "should have 13 cards of each suite" do
      card_hash = Hash.new(0)
      deck.cards.each do |card|
        card_hash[card.suit] += 1
      end
      expect(card_hash[:spade]).to eq(13)
      expect(card_hash[:heart]).to eq(13)
      expect(card_hash[:diamond]).to eq(13)
      expect(card_hash[:club]).to eq(13)
    end
  end

  describe "#shuffle" do
    let(:deck1) { Deck.new }
    let(:deck2) { Deck.new }
    it "returns a shuffled deck" do
      expect(deck1.cards).not_to eq(deck2.cards)
    end
  end

  describe "#deal" do
    before(:each) {deck.deal}
    it "deals one card" do
      expect(deck.cards.length).to eq(51)
    end

    it "returns an instance of Card" do
      expect(deck.deal).to be_a(Card)
    end
  end
end
