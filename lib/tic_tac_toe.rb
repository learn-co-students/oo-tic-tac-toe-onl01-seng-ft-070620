class TicTacToe

  WIN_COMBINATIONS = [
    
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [6,4,2], 
    [0,3,6],
    [1,4,7],
    [2,5,8]
    
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
  

  def move(index, token = "X")
    
    @board[index] = token
    
  end 
  

  def position_taken?(index)
    
    @board[index] != " " 
    
  end 


  def valid_move?(index)
    
    !position_taken?(index) && index.between?(0, 8)
    
  end 
  

  def current_player
    
    if 
      
      turn_count.even?
      
      "X"
      
    else
      
      turn_count.odd?
      
      "O"
      
    end 
  end
  

  def turn_count
    
    turns_played = 0 
    
    @board.each do |square| 
      
      if square == "O" || square == "X"
        
        turns_played += 1
        
      end
    end 
    
    
    turns_played
    
  end 
  

  def turn 
    
    puts "Please enter a number between 1 and 9" 
    
    user_input = gets.chomp
    
    index = input_to_index(user_input)
    
    if valid_move?(index) 
      
      player = current_player
      
      move(index, player)
      
    else turn
      
    end 
    
    
    display_board
    
  end 
  

  def won?
    
      WIN_COMBINATIONS.each do |winning_board|
        
    if position_taken?(winning_board[0]) && @board[winning_board[0]] == @board[winning_board[1]] && @board[winning_board[1]] == @board[winning_board[2]]
      
      return winning_board
      
    end 
  end 
    
    
    false
    
  end 
  

  def full?
    
    @board.all? {|index| index == "X" || index == "O"}
    
  end 
  

  def draw?
    
    if !won? && full?
      
      return true 
      
    else 
      
      return false 
      
    end 
  end 
  

  def over?
    
    if won? || draw?
      
      return true
      
    else 
      
      return false 
      
    end 
  end 
  

  def winner
    
    index = []
    
    index = won?
    
    if index == false 
      
      return nil
      
    else 
      
      if @board[index[0]] == "X"
        
        return "X"
        
      else 
        
        return "O"
        
      end 
    end 
  end 
  

def play
  
  until over?
  
    turn
    
  end 
  
  
  if won?
    
    puts "Congratulations #{winner}!"
    
  else draw?
    
    puts "Cat's Game!"
    
    end 
  end
end 