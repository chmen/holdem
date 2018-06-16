class CardStack
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def self.card_deck
    array_of_cards = []
    Card::CARD_SUITS.each do |suit|
      Card::CARD_FACES.each do |face|
        array_of_cards << Card.new(face, suit)
      end
    end
    deck = CardStack.new(array_of_cards.shuffle!)
  end
end
