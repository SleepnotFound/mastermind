class Game
  attr_reader :password, :attempt

  def initialize
    @password = nil
    @attempt = nil
    mode_selection
  end
  def mode_selection
    mode = gets.chomp
    if mode == "1" then play_maker 
    elsif mode == "2" then play_breaker 
    else 
      puts "Not a valid choice. Enter 1 for 'maker' or 2 for 'breaker'"
      mode_selection 
    end
  end
end

def play_breaker
  puts "playing as breaker"
  @password = Computer.new.gen_code
  puts "computer's code: #{color_pegs(password.clone)}"
  @attempt = User.new.user_turn
  find_clues(self.password.clone, self.attempt.clone)
  puts "originals: #{password} vs #{attempt}"
end

def play_maker
  puts "playing as maker"
  #user makes code/validate 
  #computer makes a turn
  #if com guess is right end game
  #else repeate com turn
end

def find_clues(pass, guess)
  puts "Your clues:"
  guess.map.with_index do |input,idx|
    if input == pass[idx]
      puts "#{color_pegs("black")}"
      pass[idx] = "X"
      guess[idx] = "X"
    end
  end
  pass.delete("X")
  guess.delete("X")
  guess.each do |g|
    if pass.include?(g)
      puts "#{color_pegs("white")}"
      pass.delete_at(pass.index(g))
    end
  end
end