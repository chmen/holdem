require 'combination'

describe 'Combination' do
  describe '#initialize' do
    it 'create array with 7 cards' do
      card1 = Card.new('2', 'H')
      card2 = Card.new('3', 'S')
      handA = CardStack.new([card1, card2])

      card3 = Card.new('2', 'C')
      card4 = Card.new('4', 'H')
      card5 = Card.new('5', 'H')
      card6 = Card.new('6', 'D')
      card7 = Card.new('A', 'S')
      table = CardStack.new([card3, card4, card5, card6, card7])
      combination = Combination.new(handA, table)
      expect(combination.cards.count).to eq 7
      expect(combination.cards.class).to eq Array
      expect(combination.cards[0].class).to eq Card
    end
  end

  describe '#highest_card' do
    it 'return highest card in combination' do
      card1 = Card.new('2', 'H')
      card2 = Card.new('3', 'S')
      card3 = Card.new('2', 'C')
      card4 = Card.new('4', 'H')
      card5 = Card.new('5', 'H')
      card6 = Card.new('6', 'D')
      card7 = Card.new('A', 'S')
      @deck = CardStack.new([card1, card2, card3, card4, card5, card6, card7])

      handA = CardStack.hand(@deck)
      @table = CardStack.table_on_flop(@deck)
      CardStack.add_card_to_table(@table, @deck)
      CardStack.add_card_to_table(@table, @deck)
      combination = Combination.new(handA, @table)
      expect(combination.highest_card.class).to eq Card
      expect(combination.highest_card).to eq card7
    end
  end

  describe '#pair' do
    it 'return pair from combination' do
      card1 = Card.new('2', 'H')
      card2 = Card.new('3', 'S')
      card3 = Card.new('2', 'C')
      card4 = Card.new('4', 'H')
      card5 = Card.new('5', 'H')
      card6 = Card.new('6', 'D')
      card7 = Card.new('A', 'S')
      @deck = CardStack.new([card1, card2, card3, card4, card5, card6, card7])

      handA = CardStack.hand(@deck)
      @table = CardStack.table_on_flop(@deck)
      CardStack.add_card_to_table(@table, @deck)
      CardStack.add_card_to_table(@table, @deck)
      combination = Combination.new(handA, @table)
      expect(combination.pair).to eq [card1, card3] || [card3, card1]
    end
  end

  # describe '#one_pair?' do
  #   it 'retutn true if combination has one pair' do
  #     card1 = Card.new('2', 'H')
  #     card2 = Card.new('3', 'S')
  #     handA = CardStack.new([card1, card2])

  #     card3 = Card.new('2', 'C')
  #     card4 = Card.new('4', 'H')
  #     card5 = Card.new('5', 'H')
  #     card6 = Card.new('6', 'D')
  #     card7 = Card.new('A', 'S')
  #     table = CardStack.new([card3, card4, card5, card6, card7])
  #     combination = Combination.new(handA, table)
  #     puts combination.cards.last.face
  #     expect(combination.one_pair?).to eq [card1, card3]
  #     # combination = Combination.new([card1, card2, card3, card4, card5, card6, card7])
  #     # expect(combination.one_pair?).to eq true
  #   end
  # end
end
