require 'pry'
class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]
        
    def initialize board = nil
        @board = board || Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
    end

    def input_to_index(input)
        input.to_i - 1  
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " " 
    end

    def valid_move?(index)
        (0..8).include?(index) && @board[index] == " "
    end

    def turn_count
        @board.count {|spot| spot != " "}
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Select a board position between 1-9: "
        input = gets.chomp
        index = input_to_index(input)
        
        if valid_move?(index) 
            move(index, current_player)
        else
           turn 
        end 
        display_board
    end

    def won? 
        WIN_COMBINATIONS.detect do |win_index| 
            @board[win_index[0]] != " " && 
            @board[win_index[0]] == @board[win_index[1]] && 
            @board[win_index[1]] == @board[win_index[2]]
            #Below is the same code as above, except they are separated into statement "X"s and "O"s rather than having them fall into the same line of code. 
            # if @board[win_index[0]] == "X" &&  @board[win_index[1]] == "X" && @board[win_index[2]] == "X"
            #     win_index
            # elsif @board[win_index[0]] == "O" &&  @board[win_index[1]] == "O" && @board[win_index[2]] == "O"
            #     win_index
            # end
        end
    end

    def full?
        !@board.include?(" ")
    end

    def draw?
        !won? && full? 
    end

    def over? 
        won? || draw? 
    end

    def winner
        won? ? @board[won?[0]] : nil
    end

    def play
        until over? 
            turn
        end

        if won? 
            puts "Congratulations #{winner}!"
        elsif draw? 
            puts "Cat's Game!"
        end
        #more efficient below but less clear
        #puts won? ?  "Congratulations #{winner}!" : "Cat's Game!"
    end
end

