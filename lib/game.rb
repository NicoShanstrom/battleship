require './lib/ai'
require './lib/board'
class Game
    
    
    def initialize
        @ai = Ai.new
        @board = Board.new
        @ai.place_ships
    end

    def setup
        puts "I have laid out my ship on the grid. 
        You now need to lay out your two ships.
        The Cruiser is three units long and the 
        Submarine is two units long."
        # require 'pry'; binding.pry
        puts "#{@board.render_board}"
        puts "Enter the squares for the Cruiser (3 spaces):
        >" 
        input = gets.chomp.split
        # require 'pry'; binding.pry
        until check_coordinates(input) == true
            puts "Those are invalid coordinates. Please try again."
            input = gets.chomp.split
        end
        temp_place_ship(input)

        puts @board.render_board(true)
        puts "Enter the squares for the Submarine (2 spaces):
        >"

        user_submarine_coordinates = gets.chomp.split
        user_submarine_coordinates.each do |coordinate|
            if !@board.valid_coordinate?(coordinate)
                exit
            end
        end
        ship_sub = Ship.new("Submarine", 2)
        if @board.valid_placement?(ship_sub, user_submarine_coordinates)
            @board.place(ship_sub, user_submarine_coordinates)
        else 
            exit
        end

        puts @board.render_board(true)
        puts "Enter the squares for the Submarine (2 spaces):
        >"
        if user_submarine_coordinates.all? {|coordinate| @board.valid_coordinate?(coordinate)}
            puts "Those are invalid coordinates. Please try again:"
        end
    end
    
    def check_coordinates(coordinate_array)
        coordinate_array.each do |coordinate|
            # require 'pry'; binding.pry
            if @board.valid_coordinate?(coordinate)
                return true
            else
                return false
                break
            end
        end
    end

    def temp_place_ship(user_cruiser_coordinates)
        ship_cru = Ship.new("Cruiser", 3)
        if @board.valid_placement?(ship_cru, user_cruiser_coordinates)
            @board.place(ship_cru, user_cruiser_coordinates)
        end
    end
end
