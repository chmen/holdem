# TODO: check require type
require_relative 'card'
require_relative 'card_stack'

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
    winner = determin_winner(handA, handB, handC, @table)
    puts "The winner is #{winner}"
  end

  def determin_winner(handA, handB, handC, table)
    highest_combination = [handA, handB, handC].shuffle.first
    case highest_combination
    when handA
      winner = 'Player A '
    when handB
      winner = 'Player B'
    when handC
      winner = 'Player C'
    end
    "#{winner} + with + #{highest_combination.cards}"
  end
end

# game = Game.new
# game.play
