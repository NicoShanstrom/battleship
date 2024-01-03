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
end 