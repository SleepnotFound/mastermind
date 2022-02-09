require_relative 'display.rb'
require_relative 'play_maker.rb'
require_relative 'play_breaker.rb'

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

puts instructions
Game.new