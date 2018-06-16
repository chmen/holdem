require 'combination'

describe 'Combination' do
  describe '#initialize' do
    it 'create array with 7 cards' do
      card1 = Card.new('2', 'H')
      card2 = Card.new('3', 'S')
      card3 = Card.new('2', 'C')
      card4 = Card.new('4', 'H')
      card5 = Card.new('5', 'H')
      card6 = Card.new('6', 'D')
      card7 = Card.new('A', 'S')
      combination = Combination.new([card1, card2, card3, card4, card5, card6, card7])
      expect(combination.cards.count).to eq 7
      expect(combination.cards[0].class).to eq Card
    end
  end

  describe '#one_pair?' do
    it 'retutn true if combination has one pair' do
      card1 = Card.new('2', 'H')
      card2 = Card.new('3', 'S')
      card3 = Card.new('2', 'C')
      card4 = Card.new('4', 'H')
      card5 = Card.new('5', 'H')
      card6 = Card.new('6', 'D')
      card7 = Card.new('A', 'S')
      combination = Combination.new([card1, card2, card3, card4, card5, card6, card7])
      expect(combination.one_pair?).to eq true
    end
  end
end
