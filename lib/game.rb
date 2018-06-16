require 'card'

class Game

  def play
    deck = CardStack.card_deck

    # Player A hand: AD KD
    handA = CardStack.hand
    # Player B hand: AC TD
    handB = CardStack.hand
    # Player C hand: QD QC
    handC = CardStack.hand

    # Table on flop: 2D 5C 7D
    table = []
    table << CardStack.flop
    # Table on turn: 2D 5C 7D QH
    table << CardStack.turn
    # Table on river: 2D 5C 7D QH 4D
    table << CardStack.river

    determin_winner(handA, handB, handC, table)

    # Player A win: 2D 4D 7D KD AD (flush)
  end

end
