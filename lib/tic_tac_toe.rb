def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def turn_count(board)
  count = 0
  board.each_with_index do |val, index|
    if (board[index] == "X" || board[index] == "O")
      count += 1
    end
  end
  return count
end

def current_player(board)
  return turn_count(board) % 2 == 0 ? "X" : "O"
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |i|
    if i.all? {|x| board[x] == "X"  ? TRUE : FALSE}
      return i
    end
    if i.all? {|x| board[x] == "O"  ? TRUE : FALSE}
      return i
    end
  end
  return false
end

def full?(board)
  if board.all? {|x| x != " "} 
    return true
  end
  return false
end

def draw?(board)
  if (!won?(board) && full?(board))
    return true
  end
  return false
end

def over?(board)
  if (draw?(board) || won?(board))
    return true
  end
  return false
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
  return nil
end

def play(board)
<<<<<<< HEAD
  until(over?(board))
    turn(board)
  end
  if(won?(board))
    puts "Congratulations #{winner(board)}!"
  end
  if(draw?(board))
    puts "Cat's Game!"
=======
  for i in (0...9)
    turn(board)
    if(winner(board) != nil)
      puts "test"
      break
    end
    if(draw?(board))
      puts "draw"
      break
    end
>>>>>>> 4498f7c461f78e0b61df1f915dc17be818cf708c
  end
end











