# frozen_string_literal: true

class Board
  attr_accessor :board_array
  
  def initialize
    board_rows = Array.new(3)
    @board_array = board_rows.map { |y| y = Array.new(3, ' ') }
  end

  def play_move(y, x , symbol)
    row = @board_array[y]
    row[x] = symbol
  end

  def still_playing?
    check_for_win == nil && tie? == false
  end

  def free_square?(y, x)
    @board_array[y][x] == ' '
  end

  def check_for_win
    unless tie?
      col = check_columns
      row = check_rows
      dia = check_diagonals
      return col unless col.nil?
      return row unless row.nil?
      return dia unless dia.nil?
      return '?'
    end
    'tie'
  end

  def check_columns
    for x in 0..2
      if @board_array[0][x] == @board_array[1][x]
        if @board_array[1][x] == @board_array[2][x]
          return @board_array[0][x] if @board_array[0][x] != ' '
        end
      end
    end
    nil
  end

  def check_rows
    for y in 0..2
      if @board_array[y][0] == @board_array[y][1]
        if @board_array[y][1] == @board_array[y][2]
          return @board_array[y][0] if @board_array[y][0] != ' '
        end
      end
    end
    nil
  end

  def check_diagonals
    if @board_array[0][0] == @board_array[1][1]
      if @board_array[1][1] == @board_array[2][2]
        return @board_array[0][0] if @board_array[0][0] != ' '
      end
    end
    if @board_array[0][2] == @board_array[1][1]
      if @board_array[1][1] == @board_array[2][0]
        return @board_array[0][2] if @board_array[0][2] != ' '
      end
    end
    nil
  end

  def tie?
    for i in 0..2
      return false if @board_array[i].include?(' ')
    end
    true
  end
end