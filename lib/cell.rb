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
        if @ship.nil?
            true
        else
            false
        end
    end 

    def place_ship(boat_name)
        @ship = boat_name
    end

    def fired_upon?
        @fired_upon
    end

    def fire_upon
        if @ship.nil?
            @fired_upon = true
        else 
            @ship.hit
            @fired_upon = true
        end
    end

    def render(reveal_ship = false)
        if ship_exists?
            if @ship.sunk?
                "X"
            elsif ship_got_hit(reveal_ship)
                "H"
            elsif reveal_ship
                "S"
            else
                "."
            end
        elsif @fired_upon == false
            "."
        elsif @fired_upon == true && @ship.nil?
            "M"
        end
    end

    def ship_got_hit(reveal_ship)
        (reveal_ship && @fired_upon) || @fired_upon
    end 

    def ship_exists?
        !@ship.nil?
    end
end 