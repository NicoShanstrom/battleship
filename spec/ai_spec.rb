require './lib/ai'
require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Ai do
    it 'exists' do
        ai = Ai.new
        expect(ai).to be_an_instance_of Ai
    end 

    it 'can select coordinates' do
        ai = Ai.new
        submarine = ai.submarine
        sub_coordinates = ai.select_coordinates(submarine)

        expect(ai.board.valid_placement?(submarine, sub_coordinates)).to be(true)

        cruiser = ai.cruiser
        cruiser_coordinates = ai.select_coordinates(cruiser)

        expect(ai.board.valid_placement?(cruiser, cruiser_coordinates)).to be(true)
    end
end 