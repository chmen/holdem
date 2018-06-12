class Card
  CARD_FACES = %w[2 3 4 5 6 7 8 9 T J Q K A]
  CARD_SUITS = %w[H S C D]


  def initialize(face='2', suit='H')
    @face = face
    @suit = suit
  end

  def name
    "#{@face}#{@suit}"
  end
end
