require './lib/board'
require './lib/ship'
class Ai
    attr_reader :board, :submarine, :cruiser
    def initialize
        @board = Board.new
        @cruiser = Ship.new('Cruiser', 3)
        @submarine = Ship.new('Submarine', 2)
        @coordinates = [
            "A1", "A2", "A3", "A4",
            "B1", "B2", "B3", "B4",
            "C1", "C2", "C3", "C4",
            "D1", "D2", "D3", "D4"
        ]
    end

    def select_coordinates(ship)
        ship_coordinates = @coordinates.sample(ship.length).sort
        if @board.valid_placement?(ship, ship_coordinates)
            ship_coordinates
        else
            select_coordinates(ship)
        end
    end

    def place_ships
        sub_coordinates = select_coordinates(@submarine)
        cruiser_coordinates = select_coordinates(@cruiser)

        @board.place(@submarine, sub_coordinates)
        @board.place(@cruiser, cruiser_coordinates)
    end
end 