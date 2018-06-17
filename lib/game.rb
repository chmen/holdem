require_relative 'card'
require_relative 'card_stack'
require_relative 'combination'

# Test class for terminal, lunch with  $ruby game.rb from lib
class Game
  def play
    @deck = CardStack.card_deck
    hand_over
    flop_turn_river
    # Player A win: 2D 4D 7D KD AD (flush)
    puts determin_winner
  end

  def hand_over
    # Player A hand: AD KD
    @hand_a = CardStack.hand(@deck)
    puts "Player A hand #{@hand_a.cards}"
    # Player B hand: AC TD
    @hand_b = CardStack.hand(@deck)
    puts "Player B hand #{@hand_b.cards}"
    # Player C hand: QD QC
    @hand_c = CardStack.hand(@deck)
    puts "Player C hand #{@hand_c.cards}"
  end

  def flop_turn_river
    # Table on flop: 2D 5C 7D
    @table = CardStack.table_on_flop(@deck)
    puts "table on flop #{@table.cards}"
    # # Table on turn: 2D 5C 7D QH
    CardStack.add_card_to_table(@table, @deck)
    puts "table on turn #{@table.cards}"
    # Table on river: 2D 5C 7D QH 4D
    CardStack.add_card_to_table(@table, @deck)
    puts "table on river #{@table.cards}"
    puts "cards in deck left #{@deck.cards.count}"
  end

  def determin_winner#(hand_a, hand_b, hand_c)
    combination1 = Combination.new(@hand_a, @table)
    combination2 = Combination.new(@hand_b, @table)
    combination3 = Combination.new(@hand_c, @table)

    hand = Combination.highest_hand(combination1, combination2, combination3)

    case hand
    when combination1
      "Player A with #{combination1.c_name} - #{combination1.combo}"
    when combination2
      "Player B with #{combination2.c_name} - #{combination2.combo}"
    when combination3
      "Player C with #{combination3.c_name} - #{combination3.combo}"
    end
  end
end

game = Game.new
game.play
