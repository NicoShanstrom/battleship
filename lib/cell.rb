class Cell
    attr_reader :coordinate,
                :ship,
                :fired_upon
    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired_upon = false
    end 

    def empty?
        @ship.nil?
    end 

    def place_ship(boat_name)
        @ship = boat_name
    end

    def fired_upon?
        @fired_upon
    end

    def fire_upon
        if !@ship.nil?
            @ship.hit
        end
        @fired_upon = true
    end

    def render(reveal_ship = false)
        return "X" if ship&.sunk?
        return "H" if ship && fired_upon?
        return "M" if !ship && fired_upon?
        return "S" if ship && reveal_ship

        "."
    end

    def ship_got_hit(reveal_ship)
        (reveal_ship && @fired_upon) || @fired_upon
    end 

    def ship_exists?
        !@ship.nil?
    end
end 