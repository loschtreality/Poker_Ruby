require 'rspec'
require 'hand'
require 'deck'
require 'byebug'



describe Hand do
  subject(:hand) {Hand.new}
  let(:deck) {double("deck", :deal => Card.new(8,:spade))}
  let(:card) {double("card", :value => Card.new())}
  before(:each) do
    5.times do
      hand.draws << deck.deal
    end
  end
  describe '#initialize' do
    it "should have zero cards" do
      expect(hand.draws.length).to eq(5)
    end
  end

  describe "#exchange" do

    it "should exchange one card and get one back" do
      p hand.draws
      # hand.exchange(, [Card.new(9, :hearts)])
      expect(hand.draws.length).to eq(5)
    end
    it "should exchange two card and get two back" do
      hand.exchange([deck.deal,deck.deal], [deck.deal,deck.deal])
      expect(hand.draws.length).to eq(5)
    end
    it "should exchange three card and get three back" do
      hand.exchange([deck.deal,deck.deal,deck.deal], [deck.deal,deck.deal,deck.deal])
      expect(hand.draws.length).to eq(5)
    end
  end

  describe "#straight" do
    let(:straight_hand) { [ Card.new(1,:spade), Card.new(2,:spade),  Card.new(3,:spade), Card.new(4,:spade), Card.new(5,:spade)] }
    let(:h4nd) { Hand.new(straight_hand)}
    it "should return a straight" do
      expect(h4nd.straight?).to be true
    end
  end

  describe "#full_house" do
    let(:full_hand) { [ Card.new(7,:spade), Card.new(7,:spade),  Card.new(7,:spade), Card.new(12,:spade), Card.new(12,:spade)] }
    let(:h4nd) { Hand.new(full_hand)}
    it "should return a full hand" do
       expect(h4nd.full_house?).to be true
    end
  end

  describe "#n_pair" do
    let(:full_hand) { [ Card.new(7,:spade), Card.new(7,:spade),  Card.new(7,:spade), Card.new(12,:spade), Card.new(12,:spade)] }
    let(:h4nd) { Hand.new(full_hand)}
    it "should return a high hand" #do
      # expect(h4nd.full_hand)
    #end
    it "should return a two pair" #do
      # expect(h4nd.full_hand)
    #end
    it "should return a three of a kind" #do
      # expect(h4nd.full_hand)
    #end
  end

  describe "#tripple" do
    let(:tripple_hand) { [ Card.new(7,:spade), Card.new(7,:spade),  Card.new(7,:spade), Card.new(12,:spade), Card.new(12,:spade)] }
    let(:h4nd) { Hand.new(tripple_hand)}
    it "should return true if a tripple is present" do
      expect(h4nd.tripple).to be true
    end
  end


end
