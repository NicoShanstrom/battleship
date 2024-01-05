
class Gameplay
    
    def initialize
    
    end

    def main_menu
       
        puts "Welcome to BATTLESHIP"
        puts "Enter p to play. Enter q to quit."
        choice = gets.chomp.downcase
        if choice == "p"
            start_game
        elsif choice == 'q'
            exit
        else
            puts "Invalid choice. Please enter p or q"
            main_menu
        end

    end
end