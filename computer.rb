class Computer
  def com_code
    options = %w[r g y b m c]
    com_guess = Array.new
    4.times { com_guess.push(options.sample) }
    com_guess
  end
  def com_turn
    #return valid 4 color combo for comparison
  end
end