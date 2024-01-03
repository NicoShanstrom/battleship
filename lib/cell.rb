class Cell
    attr_reader :coordinate,
                :ship,
                :fired_upon
    def initialize(coordinate, ship = nil, fired_upon = false)
        @coordinate = coordinate
        @ship = ship
        @fired_upon = fired_upon
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

    # def render(reveal_ship = false)
    #     if fired_upon?
    #         if @ship.sunk?
    #             "X"
    #         elsif @ship.hit
    #             "H"
    #         elsif @ship.fired_upon && hit == false
    #             "M"
            
    #         end
    #     elsif reveal_ship && @ship
    #         "S"
    #     else
    #         "."
    #     end
    # end

    def render

end 