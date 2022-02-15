module Pieces
  @@pegs = {
    black: "\e[30m\u2714\e[0m",
    r: "\e[31m\u2B1F\e[0m",
    g: "\e[32m\u2B1F\e[0m",
    y: "\e[33m\u2B1F\e[0m",
    b: "\e[34m\u2B1F\e[0m",
    m: "\e[35m\u2B1F\e[0m",
    c: "\e[36m\u2B1F\e[0m",
    white: "\e[37m\u2714\e[0m"
  }
  def color_pegs(color)
    if color.class == String
      @@pegs[color.to_sym]
    elsif color.class == Array
      color.map! do |element|
        @@pegs[element.to_sym]
      end
      color.join(" ")
    end
  end
end

def instructions
include Pieces
  <<~HEREDOC
    \e[4mMastermind Rules\e[0m

    Mastermind is a 2-player game.(computer will play as player 2)
    Choose if you want to play as a 'maker' or 'breaker'.
    

    The 'maker' is task with creating a 4 color code out of the available colors.
    Repeating colors are OK.
    red(r), green(g), yellow(y), blue(b), magenta(m), cyan(c)
    #{color_pegs("r")} #{color_pegs("g")} #{color_pegs("y")} #{color_pegs("b")} #{color_pegs("m")} #{color_pegs("c")}
    
    The 'breaker' is task with breaking the code in 12 turns or less!
    After each attempt the breaker will have hints indicating how close they got.
    To enter colors, refer to the first letter only and space them out.
    Example: inputing r b y c is the same as red, blue, yellow, cyan (#{color_pegs(["r","b","y","c"])} ).
      
    What are the hints?
    A black checkmark #{color_pegs("black")} indicates a correct color in the right position.
    A white checkmark #{color_pegs("white")} indicates a correct color in the wrong position.
    Only 4 clues per attempt.
    The order of clues does not correspond with your attempted order!
  
    Goodluck!
  
    Enter 1 to play as 'maker'
    Enter 2 to play as 'breaker'
  HEREDOC
end

  