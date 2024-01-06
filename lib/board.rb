
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
        #checks for ship length to equal coordinate count
        return false if coordinates.count != ship.length || coordinates.length > 3
        #checks for not overlapping
        return false if coordinates.any? {|coord| !@cells[coord].empty?}
         # Check for L shape:
        return false if coordinates.each_cons(3).any? do |coord1, coord2, coord3|
            (coord1[0] == coord2[0] && coord2[1] == coord3[1]) ||
            (coord1[1] == coord2[1] && coord2[0] == coord3[0])
        end
        #extract the first letter and number from the first coordinate, can be used for rendering the board when ship is placed for future reference
        first_letter = coordinates[0][0]
        first_number = coordinates[0][1].to_i
        #checks for consecutive placement either horizontally or vertically
        consecutive = coordinates.each_cons(2).all? do |coord1, coord2|
            (coord1[0] == coord2[0] && (coord2[1].to_i - coord1[1].to_i).abs == 1) ||
            (coord1[1] == coord2[1] && (coord2[0].ord - coord1[0].ord).abs == 1)        
        end
        
        #verifies consecutive placement and no duplicate cells in placement
        consecutive && coordinates.uniq.size == coordinates.size 
    end

    def place(ship, coordinates)
        coordinates.each do |coordinate|
          @cells[coordinate].place_ship(ship)
        end
    end



    def render2(reveal = false)
    board_string = ""
    board_string += "  1 2 3 4 \n" 
    ('A'..'D').each do |row|
        board_string += row + " "
        (1..4).each do |col|
            cell_key = row + col.to_s
            board_string += @cells[cell_key].render(reveal) + " "
        end
        board_string += "\n"
    end

    board_string
    end


end

