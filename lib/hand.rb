require 'deck'

class Hand
  def initialize()
    @draws = [Deck.deal, Deck.deal, Deck.deal, Deck]
  end
end
