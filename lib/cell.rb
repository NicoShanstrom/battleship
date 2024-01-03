class Cell
    attr_reader :coordinate,
                :ship
    def initialize(coordinate, ship = nil)
        @coordinate = coordinate
        @ship = ship
    end 

    def empty?
        if @ship.nil?
            true
        else
            false
        end
    end 

    def place_ship(boat_name)
        @ship = boat_name
    end
end 