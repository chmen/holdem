require 'combination'

describe 'Combination' do
  let!(:card1) { Card.new('2', 'H') }
  let!(:card2) { Card.new('3', 'S') }
  let!(:card3) { Card.new('K', 'C') }
  let!(:card4) { Card.new('4', 'H') }
  let!(:card5) { Card.new('7', 'H') }
  let!(:card6) { Card.new('J', 'C') }
  let!(:card7) { Card.new('3', 'C') }
  let!(:card8) { Card.new('5', 'C') }
  let!(:card9) { Card.new('6', 'C') }
  let!(:card10) { Card.new('A', 'C') }
  let!(:card11) { Card.new('2', 'D') }
  let!(:card12) { Card.new('3', 'D') }
  let!(:card13) { Card.new('J', 'D') }

  let!(:deck) { CardStack.new([card1, card2, card3, card4, card5, card6, card7,
                               card8, card9, card10, card11, card12, card13]) }
  let!(:table) { CardStack.table_on_flop(deck) }

  let!(:handA) { CardStack.hand(deck) }
  let!(:handB) { CardStack.hand(deck) }
  let!(:handC) { CardStack.hand(deck) }

  let!(:combination1) { Combination.new(handA, table) }
  let!(:combination2) { Combination.new(handB, table) }
  let!(:combination3) { Combination.new(handC, table) }

  describe '#initialize' do
    it 'create array with 7 cards' do
      handA = CardStack.new([card1, card2])
      table = CardStack.new([card3, card4, card5, card6, card7])
      combination = Combination.new(handA, table)

      expect(combination.cards.count).to eq 7
      expect(combination.cards.class).to eq Array
      expect(combination.cards[0].class).to eq Card
    end
  end

  describe '#high_card' do
    it 'return highest card in combination' do
      CardStack.add_card_to_table(table, deck)
      CardStack.add_card_to_table(table, deck)

      expect(combination3.high_card).to eq ['high_card', [card6]]
    end
  end

  describe '#pair' do
    it 'return pair from combination' do
      CardStack.add_card_to_table(table, deck)
      CardStack.add_card_to_table(table, deck)
      expect(combination3.pair).to eq ['pair', [card13, card6]]
    end
  end

  describe '#highest_combination' do
    context 'when pair in hand + table' do
      it 'return highest combination from hand + table' do
        CardStack.add_card_to_table(table, deck)
        CardStack.add_card_to_table(table, deck)
        expect(combination3.highest_combination).to eq ['pair', [card13, card6]]
      end
    end
    context 'when nothing in hand + table' do
      it 'return highest combination from hand + table' do
        CardStack.add_card_to_table(table, deck)
        CardStack.add_card_to_table(table, deck)
        expect(combination1.highest_combination).to eq ['high_card', [card10]]
      end
    end

    describe 'simple combination comparison' do
      it 'compare hands' do
        CardStack.add_card_to_table(table, deck)
        CardStack.add_card_to_table(table, deck)

        combination1.c_name = 'pair'
        combination2.c_name = 'high_card'

        expect(combination1 > combination2).to eq true
      end
    end

    describe '.highest_hand' do
      it 'compare hands' do

        CardStack.add_card_to_table(table, deck)
        CardStack.add_card_to_table(table, deck)


        combination1.c_name = combination1.highest_combination[0]
        combination2.c_name = combination2.highest_combination[0]
        combination3.c_name = combination3.highest_combination[0]

        # combination1.c_name = combination1.highest_combination
        # combination2.c_name = combination2.highest_combination
        # combination3.c_name = combination3.highest_combination

        h_hand = Combination.highest_hand(combination1, combination2, combination3)
        expect(h_hand).to eq combination3
      end
    end
  end
end
