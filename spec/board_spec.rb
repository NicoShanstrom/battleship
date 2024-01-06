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
            #is ship length is equal to coordinate array length
        expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
            #are the coordinates that the ship was placed on consecutive
        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(true)
            #coordinates of the ship placement cannot be diagonal
        expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
            #is this a valid placement?
        expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
        # require 'pry'; binding.pry
        expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
        expect(board.valid_placement?(cruiser, ["A1", "A2", "B2"])).to eq(false)
        
    end

    it 'can place a ship' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3) 

        board.place(cruiser, ["A1", "A2", "A3"])
        cell_1 = board.cells["A1"] 
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"]

        cell_1.ship
        cell_2.ship
        expect(cell_3.ship).to eq(cruiser)
        expect(cell_3.ship == cell_2.ship).to eq(true)
    end
    
    it 'can not overlap' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3) 
        board.place(cruiser, ["A1", "A2", "A3"])
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
    end

    it 'can render the board' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3) 
        board.place(cruiser, ["A1", "A2", "A3"])  
        
        expect(board.cells['A1']).to be_a Cell
        expect(board.cells['A1'].render).to eq('.')
        expect(board.render2).to eq(
        "  1 2 3 4 \n" +
        "A . . . . \n" +
        "B . . . . \n" +
        "C . . . . \n" +
        "D . . . . \n")
        expect(board.render2(true)).to eq(
        "  1 2 3 4 \n" +
        "A S S S . \n" +
        "B . . . . \n" +
        "C . . . . \n" +
        "D . . . . \n")

        # expect(board.render2).to output("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n").to_stdout
    end 
end