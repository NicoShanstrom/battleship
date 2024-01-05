
class Board
    attr_reader :cells, :placement
    def initialize

        @cells = {
        "A1" =>Cell.new("A1"),
        "A2" =>Cell.new("A2"),
        "A3" =>Cell.new("A3"),
        "A4" =>Cell.new("A4"),
        "B1" =>Cell.new("B1"),
        "B2" =>Cell.new("B2"),
        "B3" =>Cell.new("B3"),
        "B4" =>Cell.new("B4"),
        "C1" =>Cell.new("C1"),
        "C2" =>Cell.new("C2"),
        "C3" =>Cell.new("C3"),
        "C4" =>Cell.new("C4"),
        "D1" =>Cell.new("D1"),
        "D2" =>Cell.new("D2"),
        "D3" =>Cell.new("D3"),
        "D4" =>Cell.new("D4")

        }
        @placement_ship = []

    end

    def valid_coordinate?(coordinate)
        @cells.keys.include?(coordinate)
    end

    def valid_placement?(ship, coordinates)
        return false if coordinates.count != ship.length || coordinates.length > 3

        first_letter = coordinates[0][0]
        first_number = coordinates[0][1].to_i
        consecutive = coordinates.each_cons(2).all? do |coord1, coord2|
            (coord1[0] == coord2[0] && (coord2[1].to_i - coord1[1].to_i).abs == 1) ||
            (coord1[1] == coord2[1] && (coord2[0].ord - coord1[0].ord).abs == 1)
            
            # (coord[0] == first_letter && (coord[1].to_i - first_number).abs <= 1) ||
            # (coord[1] == first_number && (coord[0].ord - first_letter.ord).abs <= 1)
        end
        
        consecutive && coordinates.uniq.size == coordinates.size # Ensure no duplicates
        # require 'pry'; binding.pry
    end

    def place(ship, array)
        cell_1 = @cells[array[0]]
        cell_2 = @cells[array[1]]
        cell_1.place_ship(ship)
        cell_2.place_ship(ship)
        if array.length == 3
            cell_3 = @cells[array[2]]
            cell_3.place_ship(ship)
        end 
        array.each do |coordinate|
            @placement_ship << coordinate
        end
    end 
end

