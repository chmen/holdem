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
    puts "cards in deck left #{@deck.cards.count}"

    # # Table on flop: 2D 5C 7D
    # table = []
    # table << CardStack.flop
    # puts "table on flop #{table}"
    # # Table on turn: 2D 5C 7D QH
    # table << CardStack.turn
    # puts "table on turn #{table}"
    # # Table on river: 2D 5C 7D QH 4D
    # table << CardStack.river
    # puts "table on river #{table}"

    # # winner determin_winner(handA, handB, handC, table)
    # puts "The winner is #{winner}"
    # # Player A win: 2D 4D 7D KD AD (flush)
  end

end

game = Game.new
game.play
