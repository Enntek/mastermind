# Odin Ruby Project: Mastermind
# https://www.theodinproject.com/lessons/ruby-mastermind
# Goal: Build a console based version of the game Mastermind
# My settings: 6 numbers, 10 guesses

# the <super> in the baseclass Class Method refers to the Superclass's Class Method too.

# symbols: 🢂🢀⏺

# add:
# work on computer play
# make some private/public methods to get used to making these
# try namespacing using modules
# include 1 module's method

# overwrite string with a substring, does not change length

require 'pry-byebug'

# module Maths
#   class Addition
#     def sum(a, b)
#       a + b
#     end
#   end
# end

module Playable
  puts 'This is a playable game!'
end

class BoardGame
  @@version = '1.00'
  def description
    puts 'Boardgames are a great way to spend time with family!'
  end

  def self.show_version
    puts @@version
  end
end

class Mastermind < BoardGame
  @@version = '0.95 Beta'

  def initialize
    initialize_board
    take_turn
    draw_board
  end
  
  def initialize_board
    @turns = Array.new(10) { Array.new(3) }
    @turns.each_with_index do |subarr, index|
      if index < 9
        subarr[0] = "┋  #{index + 1}  ┆"
      else
        subarr[0] = "┋  #{index + 1} ┆"
      end

      subarr[1] = "┋#{'       '.bg_gray}┋#{'       '.bg_gray}┋#{'       '.bg_gray}┋#{'       '.bg_gray}┋"
      subarr[2] = '┆ ⏺ ⏺ ⏺ ⏺  ┋'
    end
  end

  def take_turn
    # @turns[0][1] = "┋#{'       '.bg_red}┋#{'       '.bg_gray}┋#{'       '.bg_green}┋#{'       '.bg_gray}┋"
  end

  def draw_board
    puts ' __________________________________________________'
    puts '┋              ⏺⏺⏺⏺ MASTERMIND ⏺⏺⏺⏺                ┋'
    # puts "       ┋#{'   ?   '.bg_red}┋#{'   ?   '.bg_red}┋#{'   ?   '.bg_red}┋#{'   ?   '.bg_red}┋"
    puts '┋==================================================┋'
    puts "┋ Turn ┋#{'   ?   '.bg_red}┋#{'   ?   '.bg_red}┋#{'   ?   '.bg_red}┋#{'   ?   '.bg_red}┋   Clues   ┋"
    puts '┋╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┋'
    @turns.each do |subarray|
      puts subarray[0] + subarray[1] + subarray[2]
      puts '┋--------------------------------------------------┋'
    end
    puts ' ⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐⌐'
  end
end

class Player
end

class Computer
end

class String
  # Overwrite part of a string, do not change length of string
  def insert_overwrite(str, index)
    self.insert(index, str)
    self[0..(index + str.length - 1)] + self[(index + str.length + str.length)..-1]
  end
end

class String
  def black;          "\e[30m#{self}\e[0m" end
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
  def brown;          "\e[33m#{self}\e[0m" end
  def blue;           "\e[34m#{self}\e[0m" end
  def magenta;        "\e[35m#{self}\e[0m" end
  def cyan;           "\e[36m#{self}\e[0m" end
  def gray;           "\e[37m#{self}\e[0m" end
  def default;        "\e[39m#{self}\e[0m" end

  def bg_black;       "\e[40m#{self}\e[0m" end
  def bg_red;         "\e[41m#{self}\e[0m" end
  def bg_green;       "\e[42m#{self}\e[0m" end
  def bg_brown;       "\e[43m#{self}\e[0m" end
  def bg_blue;        "\e[44m#{self}\e[0m" end
  def bg_magenta;     "\e[45m#{self}\e[0m" end
  def bg_cyan;        "\e[46m#{self}\e[0m" end
  def bg_gray;        "\e[47m#{self}\e[0m" end

  def bold;           "\e[1m#{self}\e[22m" end
  def italic;         "\e[3m#{self}\e[23m" end
  def underline;      "\e[4m#{self}\e[24m" end
  def blink;          "\e[5m#{self}\e[25m" end
  def reverse_color;  "\e[7m#{self}\e[27m" end
end

Mastermind.show_version
new = Mastermind.new
