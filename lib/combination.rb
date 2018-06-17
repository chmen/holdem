class Combination
  attr_accessor :cards

  def initialize(hand, table)
    @hand = hand
    @table = table
    @cards = hand.cards + table.cards
  end

  def pair
    @cards.each_with_index do |card, index|
      @cards[(index+1)..-1].each do |c|
        return [card, c] if card.face == c.face
      end
    end
    []
  end

  def highest_card
    @cards.max
  end
end
