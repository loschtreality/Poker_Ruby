# require 'deck'
require 'byebug'


class Hand
  attr_accessor :draws
  # CARD_HANDS = {hc: }
  def initialize(draws = [])
    @draws = draws
  end


  def exchange(unwanted, new_cards)
    # debugger
    unwanted.each do |card|
      raise "Bad exchange" unless @draws.include?(card)
    end
    unwanted.each do |card|
      @draws.delete(card)
    end

    new_cards.each do |card|
      @draws << card
    end
  end



  def straight?
    counter = sort_draws.first.value
    sort_draws.each_with_index do |card, index|
      index +=1
      next if index >= sort_draws.length
      return false unless sort_draws[index] == counter + 1
      counter += 1
    end
    true
  end

  def n_pair
    pairs = []
    @draws.each_with_index do |card, idx|
      @draws.each_with_index do |card2,idx2|
        next if idx2 <= idx
        if card == card2
          pairs << [card, card2]
        end
      end
    end

  end

  def tripple
    return true if sort_draws.detect{ |e| sort_draws.count(e) == 3 }
    false
  end

  def high_card
    sort_draws.last
  end

  def sort_draws
    @draws.sort {|a,b| a.value <=> b.value}.map {|card| card.value }
  end
end

a = Hand.new
a.draws = [1,2,3,4,10]
a.exchange([2,3,4],[5,8,9])
