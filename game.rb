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
    if mode == '1'
      puts "\e[4mplaying as maker\e[0m"
      puts 'Enter your password'
      @password = User.new.user_turn
      play_round
    elsif mode == '2'
      puts "\e[4mplaying as breaker\e[0m"
      puts 'Computer reay! Start decoding.'
      @password = Computer.new.gen_code
      play_round
    else
      puts "Not a valid choice. Enter 1 for 'maker' or 2 for 'breaker'"
      mode_selection
    end
  end
end

def play_round
  round = 1
  until attempt == password || round > 12
    puts round == 12 ? "\e[1mLast round!!\e[0m" : "round:#{round}"
    @attempt = mode == '1' ? Computer.new.gen_code : User.new.user_turn
    clues = find_clues(password.clone, attempt.clone)
    puts "Attempt:#{color_pegs(attempt.clone)}  Clues:#{color_pegs(clues)}"
    round += 1
  end
  results
end

def find_clues(pass, guess)
  clues = []
  guess.map.with_index do |input, idx|
    if input == pass[idx]
      clues.push('black')
      pass[idx] = 'X'
      guess[idx] = 'X'
    end
  end
  pass.delete('X')
  guess.delete('X')
  guess.each do |g|
    if pass.include?(g)
      clues.push('white')
      pass.delete_at(pass.index(g))
    end
  end
  clues
end

def results
  if attempt == password
    puts mode == '1' ? 'you lose!' : 'you win!'
  else
    puts mode == '1' ? "you win! Your code:#{color_pegs(password.clone)}" : "you lose! Computer code:#{color_pegs(password.clone)}"
  end
end
