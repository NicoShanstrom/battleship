
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
        @placement = []
    end

    def valid_coordinate?(coordinate)
        @cells.keys.include?(coordinate)
    end

    def valid_placement?(ship, coordinates)
        if coordinates.length == ship.length
            is_consecutive?(coordinates)
        else
            false
        end

    end

    def is_consecutive?(coordinates)
    
        coordinates.each_with_index do |coordinate, index|
            current_letter = coordinate[0]
            current_number = coordinate[1]
            next_letter = coordinates[index+1][0] if coordinates[index+1]
            next_number = coordinates[index+1][1] if coordinates[index+1]

            coordinates.each_cons(3) do |coordinate|
                require 'pry' ; binding.pry

            end 


        end 

    end 
    # def ship_placement(array)
    #     array = [
    #         ["A1", "A2", "A3"]
    #     ]
end

