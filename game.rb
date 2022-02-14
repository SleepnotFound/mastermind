class Game
  attr_reader :password, :attempt, :mode

  def initialize
    @password = nil
    @attempt = nil
    @mode = nil
    mode_selection
  end
  def mode_selection
    @mode = gets.chomp
    if self.mode == "1" then play_maker 
    elsif self.mode == "2" then play_breaker 
    else 
      puts "Not a valid choice. Enter 1 for 'maker' or 2 for 'breaker'"
      mode_selection 
    end
  end
end

def play_breaker
  puts "playing as breaker"
  round = 12
  @password = Computer.new.gen_code
  puts "computer's code: #{color_pegs(password.clone)}"
  until attempt == password || round == 13
    puts "round:#{round}"
    @attempt = User.new.user_turn
    find_clues(self.password.clone, self.attempt.clone)
    round += 1
  end
  results
  #puts "originals: #{password} vs #{attempt}"
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

def results
  if attempt == password
    puts mode == "1" ? "you lost" : "you won"
  else
    puts mode == "1" ? "you won" : "you lost"
  end
end