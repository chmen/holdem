class Combination
  include Comparable

  COMBINATIONS = %w[high_card pair two pair three_of_a_kind straight flush full_house four_of_a_kind straight_flush]
  attr_accessor :cards, :c_name, :combo

  def <=>(anOther)
    COMBINATIONS.index(c_name) <=> COMBINATIONS.index(anOther.c_name)
  end

  def initialize(hand, table)
    @hand = hand
    @table = table
    @cards = hand.cards + table.cards
  end

  def pair
    @cards.each_with_index do |card, index|
      @cards[(index+1)..-1].each do |c|
        return ['pair', [card, c]] if card.face == c.face
      end
    end
    []
  end

  def high_card
    ['high_card', [@cards.max]]
  end

  def highest_combination
    return pair unless pair.empty?
    high_card
  end

  def self.highest_hand(combination1, combination2, combination3)
    hand = [combination1, combination2, combination3].max

      case hand
      when combination1
        "Player A with #{combination1.c_name}"
      when combination2
        "Player B with #{combination2.c_name}"
      when combination3
        "Player C with #{combination3.c_name}"
      end
  end
end
