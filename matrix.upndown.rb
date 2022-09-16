#!/usr/bin/env ruby
class Matrix
  def initialize
    @i = 0
    @col = "\033[0;33m"
    @spielfeld = []
    40.times do
      @spielfeld << ("  ," * 40).split(",")
    end
    @posx = 20
    @posy = 20
    move
  end
  
  def show(posx, posy)
    begin
      sleep(0.02)
      puts "\e[H\e[J"
      @spielfeld[posx][posy] = "#{@col}#{(rand(33..126)).chr} \033[0m"
      @spielfeld.each do |line|
        puts line.join
      end
    rescue Interrupt     
      puts "\n\nmatrix gestoppt\n\n".upcase
      exit
    end
  end

  def move
    @posx = rand(40)
    @posy = rand(40)
    down = rand(20)
    up_down = rand(2)
    if up_down == 0
      if @posx - down < 0
        move
      else
        down.times do
          show(@posx, @posy)
          @posx -= 1
        end
        @i += 1
        if @i % 29 == 0
          @col = "\033[0;32m"
        elsif @i % 41 == 0
          @col = "\033[0;33m"
          @i = 0
        end
        move
      end
    else
      if @posx + down > 39
        move
      else
        down.times do
          show(@posx, @posy)
          @posx += 1
        end
        @i += 1
        if @i % 29 == 0
          @col = "\033[0;32m"
        elsif @i % 41 == 0
          @col = "\033[0;33m"
          @i = 0
        end
        move
      end
    end
  end
end
start = Matrix.new
