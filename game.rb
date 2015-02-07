require_relative 'players'



class Game

  def initialize 
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end


  def generate_question
    @num1 = rand(1-20)
    @num2 = rand(1-20)
    "#{@current_player.name}: What does #{@num1} plus #{@num2} equal to?"
  end


  def prompt_player_for_answer
    @input = gets.chomp
  end


  def verify_answer(answer)
    @num1 + @num2 == answer.to_i
  end


  def next_turn
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end


  def winner
    if @player1.score <=> @player2.score = 1
      winner = @player1.name
    else
      winner = @player2.name
    end
    puts "All out of lives! The winner is #{winner}."
  end

  def run_game
    until @player1.lives == 0 || @player2.lives == 0
      puts generate_question
      prompt_player_for_answer
      correct_answer = verify_answer(@input)
        if correct_answer
          @current_player.gain_a_point
       else
          @current_player.lose_a_life
          puts "Uh Oh! Incorrect. The current score is  Player 1: #{@player1.score}, Player 2: #{@player2.score}"
      end
      next_turn
    end
    winner
  end
end

new_game = Game.new 

new_game.run_game