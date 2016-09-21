require 'card'

class Deck
  attr_reader :cards
  def initialize(cards = Deck.make_deck)
    @cards = cards
  end

  def self.make_deck
    cards = []
    suites = [:spade, :heart, :diamond, :club]
    suites.each do |suite|
      13.times do |num|
        cards << Card.new(num, suite)
      end
    end
    cards.shuffle!
  end


end
