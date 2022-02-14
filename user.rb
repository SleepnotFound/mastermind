class User
  include Pieces

  def user_code
    #get valid 4 color code
  end
  def user_turn
    #get valid 4 color combo for comparison
    puts "computer ready! Enter 4: (r, g, y, b, m, c)"
    attempt = gets.chomp.downcase.split
    puts "your attempt:#{color_pegs(attempt.clone)}"
    if confirm(attempt)
      attempt
    else
      puts "wrong input. allow spaces between"
      user_turn
    end
  end
end

def confirm(ans)
  correct = %w[r g y b m c]
  if ans.length == 4
    ans.all? do |i|
      correct.include?(i)
    end
  else 
    return false
  end
end

