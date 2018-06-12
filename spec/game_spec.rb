require 'game'

describe 'Game' do
  describe '#win' do
    it 'return player A win' do
      game = Game.new
      expect(game.win).to eq 'Player A win'
    end
  end
end
