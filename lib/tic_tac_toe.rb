WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combo
       elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
         return win_combo
       end
     }
     return false
   end
   def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner (board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i
  index -= 1
  return index
end
def move(board, index, player)
  board[index] = player
  return board
end
  def position_taken? (board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(board, index)
    def position_taken?(array, ind)
      if array[ind] == " " || array[ind] == "" || array[ind] == nil
        return false
      else
        return true
      end
    end

    def on_board?(num)
      if num.between?(0, 8) == true
        return true
      else
        return false
      end
    end

    if (position_taken?(board, index)) == false && (on_board?(index) == true)
      return true
    else
      return false
    end
  end
  def turn(board)
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(board, index) == true
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end
  def turn_count(board)
    turns = 0
    board.each do |space|
      if space == "X" || space == "O"
        turns += 1
      end
    end
    return turns
  end

  def current_player(board)
    turns = turn_count(board)
    if turns % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  def play(board)
    i = 0
  while !over?(board)
    turn(board)
  end
end
