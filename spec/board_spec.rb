require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
    it 'exists' do
        board = Board.new
        expect(board).to be_an_instance_of Board
    end

    it 'can keep track of cells' do
        board = Board.new
        expect(board.cells).to be_a Hash
        expect(board.cells.count).to eq(16)
        expect(board.cells.values.first).to be_a Cell
    end

    it 'can validate coordinates' do
        board = Board.new
        expect(board.valid_coordinate?("A1")).to eq(true)
        expect(board.valid_coordinate?("D4")).to eq(true)
        expect(board.valid_coordinate?("A5")).to eq(false)
        expect(board.valid_coordinate?("E1")).to eq(false)
        expect(board.valid_coordinate?("A22")).to eq(false)
    end

    it 'can validate ship placements' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'can be consecutive' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)

    end
end