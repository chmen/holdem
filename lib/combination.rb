class Combination
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def one_pair?
    faces = []
    @cards.each do |card|
      faces << card.face
    end
    print faces
    faces.each_cons(2) do |cons|
      print cons
      return true if cons[0] == cons[1]
    end
    false
  end
end
