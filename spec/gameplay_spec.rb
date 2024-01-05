require './lib/cell'
require './lib/board'
require './lib/gameplay'

RSpec.describe Gameplay do
    it 'exists' do
        gameplay = Gameplay.new
        expect(gameplay).to be_an_instance_of Gameplay
    end

    it 'can start the game' do
        gameplay = Gameplay.new
        expect(gameplay.main_menu).to eq("Welcome to BATTLESHIP")
        expect(gameplay.main_menu).to eq("Enter p to play. Enter q to quit.")
    end

end

