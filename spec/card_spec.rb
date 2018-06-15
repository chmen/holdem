require 'card'

describe 'Card' do
  describe '#face' do
    it 'return card face' do
      card = Card.new('A', 'S')
      expect(card.face).to eq 'A'
    end
  end

  describe '.same_face?' do
    it 'return true with equal cards' do
      card1 = Card.new('A', 'S')
      card2 = Card.new('A', 'C')
      expect(Card.same_face?(card1, card2)).to eq true
    end
  end

  describe '#<=>' do
    it 'return -1 if receiver is less than another object' do
      card1 = Card.new('2', 'H')
      card2 = Card.new('3', 'H')
      expect(card1 <=> card2).to eq -1
    end
  end

  describe '#>' do
    it 'return true if anOther card is less' do
      card1 = Card.new('K', 'S')
      card2 = Card.new('6', 'H')
      expect(card1 > card2).to eq true
    end
  end
end
