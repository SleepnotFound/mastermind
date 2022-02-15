class User
  include Pieces

  def user_turn
    attempt = gets.chomp.downcase.split
    if confirm(attempt)
      attempt
    else
      puts "wrong input. Try again"
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

