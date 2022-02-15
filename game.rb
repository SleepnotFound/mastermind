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
  puts "\e[4mplaying as breaker\e[0m"
  round = 10
  @password = Computer.new.gen_code
  puts "computer ready! Enter 4 colors (r, g, y, b, m, c)"
  #puts "computer's code: #{color_pegs(password.clone)}"
  until attempt == password || round > 12
    puts round == 12 ? "\e[1mLast round!!\e[0m" : "round:#{round}"
    @attempt = User.new.user_turn
    clues = find_clues(self.password.clone, self.attempt.clone)
    puts "Attempt:#{color_pegs(attempt.clone)}  Clues:#{color_pegs(clues)}"
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
  clues = []
  guess.map.with_index do |input,idx|
    if input == pass[idx]
      clues.push("black")
      pass[idx] = "X"
      guess[idx] = "X"
    end
  end
  pass.delete("X")
  guess.delete("X")
  guess.each do |g|
    if pass.include?(g)
      clues.push("white")
      pass.delete_at(pass.index(g))
    end
  end
  return clues
end

def results
  if attempt == password
    puts mode == "1" ? "you lose!" : "you win!"
  else
    puts mode == "1" ? "you win!" : "you lose! computer code:#{color_pegs(password.clone)}"
  end
end