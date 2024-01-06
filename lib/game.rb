require './lib/ai'
class Game

    def self.setup
        ai = Ai.new
        board = Board.new
        ai.place_ships
        
        puts "I have laid out my ship on the grid. 
        You now need to lay out your two ships.
        The Cruiser is three units long and the 
        Submarine is two units long."
        puts "#{board.render_two}"
        puts "Enter the squares for the Cruiser (3 spaces):
        >" 
        user_cruiser_coordinates = gets.chomp.split
        user_cruiser_coordinates.each do |coordinate|
            if !board.valid_coordinate?(coordinate)
                exit
            end
        end
        ship_cru = Ship.new("Cruiser", 3)
        if board.valid_placement?(ship_cru, user_cruiser_coordinates)
            board.place(ship_cru, user_cruiser_coordinates)
        else 
            exit
        end

        puts board.render_two(true)
        puts "Enter the squares for the Submarine (2 spaces):
        >"
        user_submarine_coordinates = gets.chomp.split
        user_submarine_coordinates.each do |coordinate|
            if !board.valid_coordinate?(coordinate)
                exit
            end
        end
        ship_sub = Ship.new("Submarine", 2)
        if board.valid_placement?(ship_sub, user_submarine_coordinates)
            board.place(ship_sub, user_submarine_coordinates)
        else 
            exit
        end
        puts board.render_two(true)
        

        # require 'pry' ; binding.pry

    end
end
