require './lib/game'
class GamePlay

    def main_menu
        puts "Welcome to BATTLESHIP"
        puts "Enter p to play. Enter q to quit."
        choice = gets.chomp.downcase
        if choice == "p"
            new_game = Game.new()
            new_game.setup
        elsif choice == 'q'
            exit
        else
            puts "Invalid choice. Please enter p or q"
            main_menu
        end
    end
end

GamePlay.new().main_menu