class Computer
  def com_code
    #return valid 4 color code
    options = %w[r g y b m c]
    com_guess = Array.new
    4.times { com_guess.push(options.sample) }
    puts "com code:#{com_guess}"
  end
  def com_guess
    #return valid 4 color combo for comparison
  end
end