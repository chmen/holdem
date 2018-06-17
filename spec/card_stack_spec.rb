require 'card_stack'

describe 'CardStack' do
  describe '.card_deck' do
    it 'create card stack with 52 uniq cards' do
      deck = CardStack.card_deck
      expect(deck.cards.count).to eq 52
      expect(deck.cards.first.class).to eq Card
    end
  end
  describe '.hand' do
    it 'create card stack with 2 cards' do
      deck = CardStack.card_deck
      handA = CardStack.hand(deck)
      expect(handA.cards.count).to eq 2
      expect(handA.cards.first.class).to eq Card
    end
    it 'remove two last cards from the deck' do
      deck = CardStack.card_deck
      deck_size = deck.cards.count
      handA = CardStack.hand(deck)
      expect(deck.cards.count).to eq (deck_size - 2)
    end
  end
  describe '.table_on_flop' do
    it 'create card stack with 5 cards' do
      deck = CardStack.card_deck
      table = CardStack.table_on_flop(deck)
      expect(table.cards.count).to eq 3
      expect(table.cards.first.class).to eq Card
    end
    it 'remove two last cards from the deck' do
      deck = CardStack.card_deck
      deck_size = deck.cards.count
      table = CardStack.table_on_flop(deck)
      expect(deck.cards.count).to eq (deck_size - 3)
    end
  end
  describe '.add_card_to_table' do
    it 'add one card to table' do
      deck = CardStack.card_deck
      table = CardStack.table_on_flop(deck)
      CardStack.add_card_to_table(table, deck)
      expect(table.cards.count).to eq 4
    end
  end
end

