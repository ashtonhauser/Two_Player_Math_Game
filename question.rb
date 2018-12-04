class Question
  attr_accessor :num1, :num2
  attr_reader :question_template

  def initialize()
    @num1 = 1 + rand(10)
    @num2 = 1 + rand(10)
    @question_template = "Player #{:current_player}: What does #{@num1} plus #{@num2} equal?"
  end

  def correct?(player_answer)
    player_answer == (@num1 + @num2)
  end
end
