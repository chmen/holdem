require 'card_stack'

describe 'CardStack' do
  describe '.card_deck' do
    it 'create card stack with 52 uniq cards' do
      deck = CardStack.card_deck
      expect(deck.cards.count).to eq 52
      expect(deck.cards.first.class).to eq Card
    end
  end
end

