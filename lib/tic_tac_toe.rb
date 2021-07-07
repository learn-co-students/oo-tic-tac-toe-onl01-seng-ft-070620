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
   [2,4,6],
   ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, player)
    @board[index] = player
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    else
      return false
    end
  end
    
  def turn_count
    turn_number = 0
    @board.each do |tile|
      if tile == "X" || tile == "O"
        turn_number += 1
      end
    end
    turn_number
  end
  
  def current_player
    if !turn_count.odd?
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "Choose a position between 1-9"
    input = gets.chomp
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_cond|
      if @board[win_cond[0]] == "X" && @board[win_cond[1]] == "X" && @board[win_cond[2]] == "X"
        win_cond
      elsif @board[win_cond[0]] == "O" && @board[win_cond[1]] == "O" && @board[win_cond[2]] == "O"
      win_cond
      end
    end
  end
  
  def full?
    @board.all?{|filled| filled != " "}
  end
  
  def draw?
   !won? && full?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end
    
  def play
    until over?
    turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
