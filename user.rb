class User
  include Pieces

  def user_code
    #get valid 4 color code
  end
  def user_turn(code)
    #get valid 4 color combo for comparison
    puts "computer ready! Start your break attempts! (Enter 4)"
    puts "red(r), green(g), yellow(y), blue(b), magenta(m), cyan(c)"
    attempt = gets.chomp.downcase.split
    puts "your attempt:#{attempt}"
    if confirm(attempt)
      puts "comparing time"
      attempt.each_with_index do |input,idx|
        if code.include?(input)
          input == code[idx] ? (puts show_peg("black")) : (puts show_peg("white"))
          #award black clues first, white clues second. delete any matches in each check
        else puts "no clue"
        end
      end
    else
      puts "wrong message here"
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