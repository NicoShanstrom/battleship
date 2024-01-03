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
    end

    xit 'can validate ship placements' do
        board = Board.new
        expect(board).to
    end

    xit 'can render a visual representation of itself' do
        board = Board.new
        expect(board).to
    end
    
    xit 'has cell objects' do
        expect(cells.size)
        
    end

end