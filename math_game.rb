require 'pry'

@player1 = {
  name: "Player 1", 
  lives: 3,
  score: 0
}

@player2 = {
  name: "Player 2",
  lives: 3,
  score: 0
}

@current_player = @player1


def generate_question
  @num1 = rand(1-20)
  @num2 = rand(1-20)
  "#{@current_player[:name]}: What does #{@num1} plus #{@num2} equal to?"
end

def prompt_player_for_answer
    @input = gets.chomp
end

def verify_answer(answer)
   if @num1 + @num2 == answer.to_i
    return true
  else
    return false
  end
end

def next_turn
  if @current_player == @player1
    @current_player = @player2
  else
    @current_player = @player1
  end
end

def winner
  if @player1[:score] <=> @player2[:score] = 1
    winner = @player1[:name]
  else
    winner = @player2[:name]
  end
  puts "All out of lives! The winner is #{winner}."
end



def run_game
  until @player1[:lives] == 0 || @player2[:lives] == 0
    puts generate_question
    prompt_player_for_answer
    answer = verify_answer(@input)
    # binding.pry
      if answer
        @current_player[:score] += 1
     else
        @current_player[:lives] -= 1
        puts "Uh Oh! Incorrect. The current score is  Player 1: #{@player1[:score]}, Player 2: #{@player2[:score]}"
    end
    next_turn
  end
  winner
end

run_game


asdf

