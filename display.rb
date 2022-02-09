module Pieces
    @@pegs = {
      black: "\e[30m\u2714\e[0m",
      red: "\e[31m\u2B1F\e[0m",
      green: "\e[32m\u2B1F\e[0m",
      yellow: "\e[33m\u2B1F\e[0m",
      blue: "\e[34m\u2B1F\e[0m",
      magenta: "\e[35m\u2B1F\e[0m",
      cyan: "\e[36m\u2B1F\e[0m",
      white: "\e[37m\u2714\e[0m"
    }
    def show_peg(color)
      if color.class == String
        @@pegs[color.to_sym]
      elsif color.class == Integer
        
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
      #{show_peg("red")} #{show_peg("green")} #{show_peg("yellow")} #{show_peg("blue")} #{show_peg("magenta")} #{show_peg("cyan")}
      
      The 'breaker is task with breaking the code in 12 turns or less!
      After each attempt the breaker will have hints indicating how close they got.
      
      what are the hints?
      A black checkmark #{show_peg("black")} indicates a correct color in the right position.
      A white checkmark #{show_peg("white")} indicates a correct color in the wrong position.
      Only 4 clues per attempt.
      the order of clues does not correspond with your attempted order!
  
      Goodluck!
  
      Enter 1 to play as 'maker'
      Enter 2 to play as 'breaker'
      #{show_peg(2)}
    HEREDOC
end

  