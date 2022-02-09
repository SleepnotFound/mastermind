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

symbol = Text.new("\u2B1F")
clue = Text.new("\u2714")
puts symbol.color("red") 
puts clue.color("white")
puts clue.color("black")
