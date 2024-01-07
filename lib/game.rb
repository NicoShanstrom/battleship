require './lib/ai'
require './lib/board'
class Game
    attr_reader :board, :ai
    def initialize 
        @ai = Ai.new
        @board = Board.new
        @ship_cru = Ship.new("Cruiser", 3)
        @ship_sub = Ship.new("Submarine", 2)
    end

    def setup
        ai.place_ships
       
        initial_prompt
        cruiser_user_input
        
        puts board.render_board(true)
        
        submarine_user_input(board)
        
        puts board.render_board(true)
        turn(ai, board)
    end

    def turn(ai, board)
        render_board_state
        puts "Enter the coordinate for your shot: >"
        user_shot_input = gets.chomp
        verify_user_shot(user_shot_input)
    end

    def verify_user_shot(input)
        if ai.board.valid_shot?(input)
            ai.board.cells[input].fire_upon
            puts ai.board.render_board
        else
            puts "Please enter a valid coordinate:"
            user_shot_input = gets.chomp
            verify_user_shot(user_shot_input)
        end

    end

    def render_board_state
        puts "===============COMPUTER BOARD============="
        puts ai.board.render_board()
        puts "===============PLAYER BOARD==============="
        puts board.render_board(true)
    end
    
    def initial_prompt
        puts "I have laid out my ship on the grid. 
        You now need to lay out your two ships.
        The Cruiser is three units long and the 
        Submarine is two units long."
    end 

    def cruiser_user_input
        puts "#{board.render_board}"
        puts "Enter the squares for the Cruiser (3 spaces):>" 

        user_cruiser_coordinates = gets.chomp.split

        verify_input_coordinates(user_cruiser_coordinates, board, @ship_cru)
    end 

    def submarine_user_input(board)
        puts "Enter the squares for the Submarine (2 spaces):>"

        user_submarine_coordinates = gets.chomp.split

        verify_input_coordinates(user_submarine_coordinates, board, @ship_sub)
    end
    
    def verify_input_coordinates(user_input_coordinates, board, ship)
        if board.valid_placement?(ship, user_input_coordinates)
            board.place(ship, user_input_coordinates)
        else 
            puts "Those are invalid coordinates. Please try again: >"
            user_input_coordinates = gets.chomp.split
            verify_input_coordinates(user_input_coordinates, board, ship)
        end
    end 
end
