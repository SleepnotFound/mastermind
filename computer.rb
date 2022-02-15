class Computer
  def gen_code
    options = %w[r g y b m c]
    com_guess = []
    4.times { com_guess.push(options.sample) }
    com_guess
  end
end
