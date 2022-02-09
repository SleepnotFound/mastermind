def play_breaker
  puts "playing as breaker"
  options = %w[r g y b m c]
  com_guess = Array.new
  4.times { com_guess.push(options.sample) }
  puts "com code:#{com_guess}"
    
  user_turn
end

def user_turn
  puts "computer ready! Start your break attempts! (Enter 4 )"
  puts "red(r), green(g), yellow(y), blue(b), magenta(m), cyan(c)"
  
end