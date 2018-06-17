# For any stack of cards
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
    CardStack.new(array_of_cards.shuffle!)
  end

  def self.hand(deck)
    hand = CardStack.new(deck.cards.last(2))
    deck.cards = deck.cards - hand.cards
    hand
  end

  def self.table_on_flop(deck)
    table = CardStack.new(deck.cards.last(3))
    deck.cards = deck.cards - table.cards
    table
  end

  def self.add_card_to_table(table, deck)
    table.cards = table.cards << deck.cards.last
    deck.cards.pop
  end
end
