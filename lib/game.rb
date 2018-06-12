require 'card'

class Game

  def win
    card = Card.new(Card::CARD_FACES[0], Card::CARD_SUITS[0])

    "Player A win with #{card.name}"
  end

end
