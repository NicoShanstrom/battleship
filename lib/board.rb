require './lib/cell'
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
        return false if coordinates.count != ship.length
        return false if coordinates.any? {|coord| !valid_coordinate?(coord) || !@cells[coord].empty?}

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

    def render_board(reveal = false)
        if reveal
            puts "  1 2 3 4 \nA #{@cells['A1'].render(true)} #{@cells['A2'].render(true)} #{@cells['A3'].render(true)} #{@cells['A4'].render(true)} \n" +
            "B #{@cells['B1'].render(true)} #{@cells['B2'].render(true)} #{@cells['B3'].render(true)} #{@cells['B4'].render(true)} \n" +
            "C #{@cells['C1'].render(true)} #{@cells['C2'].render(true)} #{@cells['C3'].render(true)} #{@cells['C4'].render(true)} \n" +
            "D #{@cells['D1'].render(true)} #{@cells['D2'].render(true)} #{@cells['D3'].render(true)} #{@cells['D4'].render(true)} \n"
        else 
            puts "  1 2 3 4 \nA #{@cells['A1'].render} #{@cells['A2'].render} #{@cells['A3'].render} #{@cells['A4'].render} \nB #{@cells['B1'].render} #{@cells['B2'].render} #{@cells['B3'].render} #{@cells['B4'].render} \nC #{@cells['C1'].render} #{@cells['C2'].render} #{@cells['C3'].render} #{@cells['C4'].render} \nD #{@cells['D1'].render} #{@cells['D2'].render} #{@cells['D3'].render} #{@cells['D4'].render} \n"
        end
        
    end
end

