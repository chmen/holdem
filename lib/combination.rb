class Combination
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def one_pair?
    faces = []
    cards.each do |card|
      faces << card.face
    end

    faces.each do |face|
      return true if faces.count(face) == 2
    end
    false
  end
end
