#!/usr/bin/env ruby
# coding: utf-8
class Snake
  def initialize
    @spielfeld = []
    @showtime = []
    40.times do  
      @spielfeld << ("° ," * 40).split(",")
    end
    40.times do |i|
      40.times do |j|
        @showtime << [i, j]
      end
    end
    @posx = 20
    @posy = 20
    show(@posx, @posy)
    move
  end

  def show(posx, posy)
    begin
      sleep(0.01)
      puts "\e[H\e[J"
      @spielfeld[posx][posy] = "  "
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
    if @showtime.empty?
      puts "Aufgegessen... ! :-)"
      exit
    end
    kill = @showtime[rand(@showtime.size)]
    @posx = kill[0]
    @posy = kill[1]
    @showtime.delete(kill)
    show(@posx, @posy)
  end
end
start = Snake.new
