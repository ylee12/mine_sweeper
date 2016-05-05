
#$: << '.'
#require 'game_controller'

#use require_relative to avoid adding . multiple times
require_relative './game_controller'


# create a game board 10 X 10 and 10 mines
game_controller = Game_controller.new(10, 10, 10)

game_controller.set_up_game

game_controller.show_current_sate

attempt = 1

success_completion = 0


begin_time = Time.now

# Note: New Game Rules - I cheat !! 
# You will win the game if you can uncovered 20 cells without hitting any mine

begin 

  # generate random coordinates
  x_coord = rand(0..9)
  y_coord = rand(0..9)

  #puts ("Attempt #{attempt}. Trying corrdinate #{x_coord}, #{y_coord}")
 
  is_die, finish = game_controller.play_game(x_coord, y_coord)
 
  if finish == true and is_die == false
   success_completion += 1
 
   # restart up the game for play again
   game_controller.set_up_game

   puts "\n\nAnother new game:"
   
   game_controller.show_current_sate
 
  elsif (is_die)
    # restart up the game for play again
    game_controller.set_up_game
  end
 
  attempt += 1
 

end while attempt <= 100000 #is_die == false || !finish

end_time = Time.now


puts "The number of puzzles successfully solved out of 100,000 attempts is #{success_completion}."
puts "The total time to complete the 100,000 attempts is #{(end_time - begin_time)} seconds."
