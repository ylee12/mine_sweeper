
# include current dir to load_path
#$: << '.'
#require 'game_cell'

#use require_relative to avoid adding . multiple times
require_relative './game_cell'


class Game_controller

  attr_accessor :size_x, :size_y, :number_of_mime

  def initialize(a, b, c)
    
     @size_x = a
     @size_y = b
     @number_of_mime = c
     @game_board = {}
     @time_to_try = 0
     @max_try = @size_x * @size_y - @number_of_mime

     # allow to guess only X times for each game
     #@max_try = 20

  end


  # initiliaze the beginning state of the game
  def set_up_game()

    # initiliaze the beginning state of the game
    @time_to_try = 0

    for i in 0..@size_x

      for j in 0..@size_y

        #  :original_state, :current_state, :x_corrdinate, :y_corrdinate, :was_visited
        key = i.to_s + ',' + j.to_s
        @game_board[key] = Game_cell.new(".", ".", i, j, false)

      end

    end

    # set up the mines
    generate_mine_in_game_board()
    
  end


  #  generate x number of mines in random location
  def generate_mine_in_game_board

    #  generate x number of mines in random location
    mine = 0

    while mine < @number_of_mime

      x = rand(0..9)
      y = rand(0..9)
 
      key = x.to_s + ',' + y.to_s
 
      # retrieve the game cell from the hash and set the mine in this location
      cell = @game_board[key]
 
      # set the cell state to have mine
      if cell.current_state != 'M'
        cell.current_state = 'M'
        mine += 1
      end

    end
  end


  def show_current_sate

    for i in 0..@size_x

      for j in 0..@size_y

        #  :original_state, :current_state, :x_corrdinate, :y_corrdinate, :was_visited
        key = i.to_s + ',' + j.to_s
        cell = @game_board[key] 
        print "#{cell.current_state} "

      end
      puts "\n"

    end
    
  end

  # given 2 corrdinate, determine if the location has mine and if all the cells
  # have been uncovered
  def play_game(x, y)

     lose = false
     game_finish = false
     @time_to_try += 1

     #retrieve from the cell and see if he hit the mine
     key = x.to_s + ',' + y.to_s

     # retrieve the game cell from the hash
     cell = @game_board[key]
 
     cell.was_visited = true

      # set the cell state to have mine
      if cell.current_state != 'M'
        cell.current_state != 'X'
      elsif cell.current_state == 'M'
        lose = true
      end

      if @time_to_try > @max_try
        game_finish = true
      end


      return [lose, game_finish]

  end


  def determine_number_mine_around_a_cell
    
  end



end