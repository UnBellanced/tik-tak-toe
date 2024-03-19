
class TikTakToe

    def initialize()
        "-".to_sym
        "x".to_sym
        "o".to_sym
        @current_player = :x
        @board = Hash.new()
        @square = :-
        @ongoing = true
    end

    def start_game
        @current_player = :x
        @board[:"Top Right"] = :-; @board[:"Top"] = :-; @board[:"Top Left"]=:-
        @board[:"Middle Right"] = :-; @board[:"Middle"] = :-; @board[:"Middle Left"]=:-
        @board[:"Bottom Right"] = :-; @board[:"Bottom"] = :-; @board[:"Bottom Left"]=:-
        @ongoing = true
    end

    def start_turn
        @current_player==:x ? @current_player = :o : @current_player = :x
        puts "Please choose the square: "
        @square = gets.chomp.to_sym
        if @square == "Restart" 
            start_game
        end
        @board[@square] = @current_player
        puts "[#{@board[:"Top Right"]}][#{@board[:"Top"]}][#{@board[:"Top Left"]}]"
        puts "[#{@board[:"Middle Right"]}][#{@board[:"Middle"]}][#{@board[:"Middle Left"]}]"
        puts "[#{@board[:"Bottom Right"]}][#{@board[:"Bottom"]}][#{@board[:"Bottom Left"]}]"
    end

    def check_board
        if  @board[:"Top Right"] == @board[:"Middle"] && @board[:"Middle"] == @board[:"Bottom Left"] && @board[:"Bottom Left"] != :- 
            puts "#{@current_player} won!!!"
            @ongoing = false
        end
        if @board[:"Top Right"] == @board[:"Top"] && @board[:"Top"] == @board[:"Top Left"] && @board[:"Top Left"] != :- 
            puts "#{@current_player} won!!!"
            @ongoing = false
        end
        if @board[:"Middle Right"] == @board[:"Middle"] && @board[:"Middle"] == @board[:"Middle Left"] && @board[:"Middle Left"] != :- 
            puts "#{@current_player} won!!!"
            @ongoing = false
        end
        if @board[:"Bottom Right"] == @board[:"Bottom"] && @board[:"Bottom"] == @board[:"Bottom Left"] && @board[:"Bottom Left"] != :- 
            puts "#{@current_player} won!!!"
            @ongoing = false
        end
        if @board[:"Top Right"] == @board[:"Middle Right"] && @board[:"Middle Right"] == @board[:"Bottom Right"] && @board[:"Bottom Right"] != :- 
            puts "#{@current_player} won!!!"
            @ongoing = false
        end
        if @board[:"Top"] == @board[:"Middle"] && @board[:"Middle"] == @board[:"Bottom"] && @board[:"Bottom"] != :- 
            puts "#{@current_player} won!!!"
            @ongoing = false
        end
        if @board[:"Top Left"] == @board[:"Middle Left"] && @board[:"Middle Left"] == @board[:"Bottom Left"] && @board[:"Bottom Left"] != :- 
            puts "#{@current_player} won!!!"
            @ongoing = false
        end
        if @board[:"Top Left"] == @board[:"Middle"] && @board[:"Middle"] == @board[:"Bottom Right"] && @board[:"Bottom Right"] != :- 
            puts "#{@current_player} won!!!"
            @ongoing = false
        end
        if @board[:"Bottom Right"] == @board[:"Bottom"] && @board[:"Bottom"] == @board[:"Bottom Left"] && @board[:"Bottom Left"] != :- 
            puts "#{@current_player} won!!!"
            @ongoing = false
        end
    end

    def ongoing
        @ongoing
    end

end

obj = TikTakToe.new()
obj.start_game

while obj.ongoing == true do
    obj.start_turn
    obj.check_board
end