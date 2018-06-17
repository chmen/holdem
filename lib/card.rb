# Class for play card data
class Card
  include Comparable

  CARD_FACES = %w[2 3 4 5 6 7 8 9 T J Q K A].freeze
  CARD_SUITS = %w[H S C D].freeze

  attr_accessor :face, :suit

  def <=>(other)
    CARD_FACES.index(face) <=> CARD_FACES.index(other.face)
    # str.size <=> anOther.str.size
  end

  def initialize(face, suit)
    @face = face
    @suit = suit
  end

  def name
    "#{@face}#{@suit}"
  end

  def self.same_face?(card1, card2)
    card1.face = card2.face ? true : false
  end
end
