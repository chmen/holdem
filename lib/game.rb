# TODO: check require type
require_relative 'card'
require_relative 'card_stack'
require_relative 'combination'

class Game

  def play
    @deck = CardStack.card_deck

    # Player A hand: AD KD
    handA = CardStack.hand(@deck)
    puts "Player A hand #{handA.cards}"
    # deck.cards = deck.cards - handA.cards
    # Player B hand: AC TD
    handB = CardStack.hand(@deck)
    puts "Player B hand #{handB.cards}"
    # Player C hand: QD QC
    handC = CardStack.hand(@deck)
    puts "Player C hand #{handC.cards}"

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

    # Player A win: 2D 4D 7D KD AD (flush)
    puts winner = determin_winner(handA, handB, handC, @table)
  end

  def determin_winner(handA, handB, handC, table)
    combination1 = Combination.new(handA, @table)
    combination2 = Combination.new(handB, @table)
    combination3 = Combination.new(handC, @table)

    combination1.c_name = combination1.highest_combination
    combination2.c_name = combination2.highest_combination
    combination3.c_name = combination3.highest_combination

    hand = Combination.highest_hand(combination1, combination2, combination3)
  end
end

# game = Game.new
# game.play
