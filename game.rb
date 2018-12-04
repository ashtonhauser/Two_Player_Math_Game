# Question
# --------------
# both nums being added
# rest of string output
# user input

# will print a question with prefix player1 or player2, decided by current_player
# question has 2 randomly gen nums
# has an input method
# if input doesnt = actual calculated total that players life goes down
# and comment on correctness prints to screen

# Score
# --------------
# P1 Score
# P2 Score
# rest of sting output

# will hold the values of lives for each player and will print string after
# question is answered and comment on correctness is printed

# Game
# -------------
# gameloop method Each iteration player changes
# current_player

# responsable for calling all methods for the actual display of game
load "question.rb"
load "score.rb"

class Game
  attr_accessor :current_player, :game_done
  attr_reader :correct, :incorrect

  def initialize()
    @@current_player = 1
    @game_done       = false
    @iterator        = 0
    @correct         = "Player #{@@current_player}: YES! You are correct!"
    @incorrect       = "Player #{@@current_player}: Seriously? No!"
    @score           = Score.new
  end

  def start
    while @game_done === false do
      @iterator += 1

      if @iterator % 2 === 0
       @@current_player = 2
      else
       @@current_player = 1
      end

      line1 = Question.new
      puts line1.question_template
      print "> "
      answer = gets.chomp
      if answer.to_i === line1.num1 + line1.num2
        puts @correct
      else
        puts @incorrect
        if @@current_player === 1
          @score.score1 -= 1
        else
          @score.score2 -= 1
        end
      end
      if @score.score2 === 0
        puts "Player 1 wins with a score of #{@score.score1}/3"
        puts "----- GAME OVER -----"
        @game_done = true
      elsif @score.score1 === 0
        puts "Player 2 wins with a score of #{@score.score2}/3"
        puts "----- GAME OVER -----"
        @game_done = true
      else
        puts @score.to_s
        puts "----- NEW TURN -----"
      end
    end
  end
end

newGame = Game.new
newGame.start
