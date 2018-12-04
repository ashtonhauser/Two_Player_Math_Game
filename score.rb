class Score
  attr_accessor :score1, :score2

  def initialize()
    @score1 = 3
    @score2 = 3
  end

  def to_s
    puts "P1: #{@score1}/3 vs P2:#{@score2}/3"
  end
end
