class Game_cell

  attr_accessor :original_state, :current_state, :x_corrdinate, :y_corrdinate, :was_visited
    
    def initialize(a, b, c, d, e)
    
     @original_state = a
     @current_state = b
     @x_corrdinate = c
     @y_corrdinate = d
     @was_visited = e
     @number_mine_around_me = 0

    end


end



