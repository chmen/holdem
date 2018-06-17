# Hold date and behavior of cards combinations
class Combination
  include Comparable

  COMBINATIONS = %w[high_card pair two_pair three_of_a_kind straight flush
                    full_house four_of_a_kind straight_flush].freeze
  attr_accessor :cards, :c_name, :combo

  def <=>(other)
    return -1 if COMBINATIONS.index(c_name) < COMBINATIONS.index(other.c_name)
    return 1 if COMBINATIONS.index(c_name) > COMBINATIONS.index(other.c_name)

    if COMBINATIONS.index(c_name) == COMBINATIONS.index(other.c_name)
      return 1 if combo.max > other.combo.max
      return -1 if combo.max < other.combo.max
      return 0
    end
  end

  def initialize(hand, table)
    @hand = hand
    @table = table
    @cards = hand.cards + table.cards
    @c_name = highest_combination[0]
    @combo = highest_combination[1]
  end

  def pair
    @cards.each_with_index do |card, index|
      @cards[(index + 1)..-1].each do |c|
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
    [combination1, combination2, combination3].max
  end
end
