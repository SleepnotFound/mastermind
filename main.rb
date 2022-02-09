module Style
  
  @@styles = {
    reset: "\e[0m",
    bright: "\e[1m",
    underline: "\e[4m",
    blink: "\e[5m",
  
    black: "\e[30m",
    red: "\e[31m",
    green: "\e[32m",
    yellow: "\e[33m",
    blue: "\e[34m",
    magenta: "\e[35m",
    cyan: "\e[36m",
    white: "\e[37m"
  }

  def color(color)
    paint = @@styles[color.to_sym]
    "#{paint}#{string}#{@@styles[:reset]}"
  end
end

class Text
include Style
  attr_reader :string

  def initialize(string)
    @string = string
  end
end

def instructions
  sym = Text.new("\u2B1F")
  cl = Text.new("\u2714")
  <<~HEREDOC
    \e[4mMastermind Rules\e[0m

    Mastermind is a 2-player game.(computer will play as player 2)
    Choose if you want to play as a 'maker' or 'breaker'.
    

    The 'maker' is task with creating a 4 color code out of the available colors.
    Repeating colors are OK.
    #{sym.color("red")} #{sym.color("green")} #{sym.color("yellow")} #{sym.color("blue")} #{sym.color("magenta")} #{sym.color("cyan")}  
    red(r), green(g), yellow(y), blue(b), magenta(m), cyan(c)
    The 'breaker is task with breaking the code in 12 turns or less!
    After each attempt the breaker will have hints indicating how close they got.
    
    what are the hints?
    A black checkmark #{cl.color("black")} indicates a correct color in the right position.
    A white checkmark #{cl.color("white")} indicates a correct color in the wrong position.
    Only 4 clues per attempt.
    the order of clues does not correspond with your attempted order!

    Goodluck!

    Enter 1 to play as 'maker'
    Enter 2 to play as 'breaker'

  HEREDOC
end

symbol = Text.new("\u2B1F")
clue = Text.new("\u2714")
puts symbol.color("red") 
puts clue.color("white")
puts clue.color("black")

puts intro

