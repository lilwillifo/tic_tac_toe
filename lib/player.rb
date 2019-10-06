class Player
  attr_reader :letter, :is_computer
  def initialize(letter, is_computer = false)
    @letter = letter.upcase
    @is_computer = is_computer
  end
end
