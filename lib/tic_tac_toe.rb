class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  input = " "
  def input_to_index(input)
    input.to_i - 1
  end


  def move(input, character)
  @board[input] = character
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    elsif @board[index] == ""
      false
    elsif @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(input)
    if (input.between?(0,8) == true) && (@board[input] == " " || @board[input] == "" || @board[input] == nil)
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |character|
      if  character == "X" || character == "O"
        counter += 1
      end
    end
  return counter
  end

  def current_player
    number = turn_count
    if number.even? == true
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
  end
  end

  def won?
    win_index_1 = WIN_COMBINATIONS[0]
    win_index_2 = WIN_COMBINATIONS[1]
    win_index_3 = WIN_COMBINATIONS[2]
    win_index_4 = WIN_COMBINATIONS[3]
    win_index_5 = WIN_COMBINATIONS[4]
    win_index_6 = WIN_COMBINATIONS[5]
    win_index_7 = WIN_COMBINATIONS[6]
    win_index_8 = WIN_COMBINATIONS[7]
    if (@board[0] == "X" && @board[1] == "X" && @board[2] == "X") || (@board[0] == "O" && @board[1] == "O" && @board[2] == "O")
        return win_index_1
    elsif (@board[3] == "X" && @board[4] == "X" && @board[5] == "X") || (@board[3] == "O" && @board[4] == "O" && @board[5] == "O")
        return win_index_2
    elsif (@board[6] == "X" && @board[7] == "X" && @board[8] == "X") || (@board[6] == "O" && @board[7] == "O" && @board[8] == "O")
        return win_index_3
    elsif (@board[0] == "X" && @board[3] == "X" && @board[6] == "X") || (@board[0] == "O" && @board[3] == "O" && @board[6] == "O")
        return win_index_4
    elsif (@board[1] == "X" && @board[4] == "X" && @board[7] == "X") || (@board[1] == "O" && @board[4] == "O" && @board[7] == "O")
        return win_index_5
    elsif (@board[2] == "X" && @board[5] == "X" && @board[8] == "X") || (@board[2] == "O" && @board[5] == "O" && @board[8] == "O")
        return win_index_6
    elsif (@board[0] == "X" && @board[4] == "X" && @board[8] == "X") || (@board[0] == "O" && @board[4] == "O" && @board[8] == "O")
        return win_index_7
    elsif (@board[2] == "X" && @board[4] == "X" && @board[6] == "X") || (@board[2] == "O" && @board[4] == "O" && @board[6] == "O")
        return win_index_8
    end
  end

  def full?
    @board.all? do |character|
      character == "X" || character == "O"
    end
  end

  def draw?
    if won? == nil && full? == true
      true
    end
  end

  def over?
    if draw? == true
      true
    elsif !(won? == nil)
      true
    end
  end

  def winner
    if @board[0] == "X" && @board[1] == "X" && @board[2] == "X"
    return "X"
  elsif @board[3] == "X" && @board[4] == "X" && @board[5] == "X"
      return "X"
    elsif @board[6] == "X" && @board[7] == "X" && @board[8] == "X"
      return "X"
    elsif @board[0] == "X" && @board[3] == "X" && @board[6] == "X"
      return "X"
    elsif @board[1] == "X" && @board[4] == "X" && @board[7] == "X"
      return "X"
    elsif @board[2] == "X" && @board[5] == "X" && @board[8] == "X"
      return "X"
    elsif @board[0] == "X" && @board[4] == "X" && @board[8] == "X"
      return "X"
    elsif @board[2] == "X" && @board[4] == "X" && @board[6] == "X"
      return "X"
    elsif @board[0] == "O" && @board[1] == "O" && @board[2] == "O"
      return "O"
    elsif @board[3] == "O" && @board[4] == "O" && @board[5] == "O"
      return "O"
    elsif @board[6] == "O" && @board[7] == "O" && @board[8] == "O"
      return "O"
    elsif @board[0] == "O" && @board[3] == "O" && @board[6] == "O"
      return "O"
    elsif @board[1] == "O" && @board[4] == "O" && @board[7] == "O"
      return "O"
    elsif @board[2] == "O" && @board[5] == "O" && @board[8] == "O"
      return "O"
    elsif @board[0] == "O" && @board[4] == "O" && @board[8] == "O"
      return "O"
    elsif @board[2] == "O" && @board[4] == "O" && @board[6] == "O"
      return "O"
    else
      return nil
    end

  end

  def play
      until over? == true
          turn
            end
      if draw? == true
        puts "Cat's Game!"
      elsif winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      end
  end


end
