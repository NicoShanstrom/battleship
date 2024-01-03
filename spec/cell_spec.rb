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
end 