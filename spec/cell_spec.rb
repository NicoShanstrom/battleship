require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    it 'exists' do
        cell = Cell.new("B4")

        expect(cell).to be_an_instance_of Cell
    end

    it 'has coordinates and is available to place a ship' do
        cell = Cell.new("B4")

        expect(cell.coordinate).to be_a String
        expect(cell.ship).to eq(nil)
        expect(cell.empty?).to eq(true)
    end

    it 'can place a ship' do
        cruiser = Ship.new("Cruiser", 3)
        cell = Cell.new("B4")

        cell.place_ship(cruiser)
        expect(cell.ship).to eq(cruiser)
        expect(cell.empty?).to eq(false)
    end 

    it 'can be fired upon' do
        cruiser = Ship.new("Cruiser", 3)
        cell = Cell.new("B4")

        cell.place_ship(cruiser)
        expect(cell.fired_upon?).to eq(false)

        cell.fire_upon
        expect(cell.ship.health).to eq(2)

        expect(cell.fired_upon?).to eq(true)
    end

    it 'can render actions' do
        cell_1 = Cell.new("B4")

        expect(cell_1.render).to eq(".")

        cell_1.fire_upon
        expect(cell_1.render).to eq("M")
    end

    it 'can have more render actions' do
        cell_2 = Cell.new('C3')
        cruiser = Ship.new('Cruiser', 3)

        cell_2.place_ship(cruiser)
        expect(cell_2.render(true)).to eq('S')

        cell_2.fire_upon
        expect(cell_2.render).to eq('H')
        expect(cruiser.sunk?).to eq(false)
        
        cruiser.hit
        cruiser.hit
        expect(cruiser.sunk?).to eq(true)
        expect(cell_2.render).to eq('X')
      end
end 