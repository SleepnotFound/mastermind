class Game
  def initialize
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
  code = Computer.new.com_code
  puts "computer's code: #{code}"
  #com_code  
  User.new.user_turn(code)
end

def play_maker
  puts "playing as maker"
end