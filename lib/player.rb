class Player
  attr_reader :letter
  def initialize(letter = "X")
    if ['X', 'O'].include? letter.upcase
      @letter = letter.upcase
    else
      @letter = 'X'
    end
  end
end
