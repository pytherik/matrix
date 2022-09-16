#!/usr/bin/env ruby
# coding: utf-8
class Snake
  def initialize
    @spielfeld = []
    40.times do
      @spielfeld << ("O ," * 40).split(",")
    end
    @posx = 20
    @posy = 20
    show(@posx, @posy)
    move
  end

  def show(posx, posy)
    begin
      sleep(0.02)
      puts "\e[H\e[J"
      @spielfeld[posx][posy] = "° "
      @spielfeld.each do |line|
        puts line.join
      end
      move
    rescue Interrupt
      puts "\n\nschlange gestoppt\n\n".upcase
      exit
    end
  end

  def move
   show(rand(40), rand(40))
  end
end
start = Snake.new
