def get_game_status(board)
  return {status_msg: 'X Won the Game.', status: 'complete', winner: 'X'} if has_won?(board, 'X')
  return {status_msg: 'O Won the Game.', status: 'complete', winner: 'O'} if has_won?(board, 'O')
  return {status_msg: 'Game drawn.', status: 'complete', winner: ''} unless is_next_move_possible?(board)

  return {status: 'in_progress'}
end

def all_elements_in_row_have_same_char?(board, character)
  for row in 0..2
    does_all_elems_have_same_char = true

    for col in 0..2
      does_all_elems_have_same_char = does_all_elems_have_same_char && (board[row][col] == character)
    end

    return true if does_all_elems_have_same_char
  end

  false
end

def all_elements_in_col_have_same_char?(board, character)
  for col in 0..2
    does_all_elems_have_same_char = true

    for row in 0..2
      does_all_elems_have_same_char = does_all_elems_have_same_char && (board[row][col] == character)
    end

    return true if does_all_elems_have_same_char
  end

  false
end


def all_elements_in_diag1_have_same_char?(board, character)
  does_diagonal_1_have_same_char = true
  for i in 0..2
    does_diagonal_1_have_same_char = does_diagonal_1_have_same_char && (board[i][i] == character)
  end

  does_diagonal_1_have_same_char
end

def all_elements_in_diag2_have_same_char?(board, character)
  does_diagonal_2_have_same_char = true
  2.downto(0) do |i|
    j = 2 - i
    does_diagonal_2_have_same_char = does_diagonal_2_have_same_char && (board[i][j] == character)
  end

  does_diagonal_2_have_same_char
end


def has_won?(board, character)
  # 1. row wise check
  # 2. col wise check
  # 3. Diagonal check - 1
  # 4. Diagonal check - 2

  all_elements_in_row_have_same_char?(board, character) ||
    all_elements_in_col_have_same_char?(board, character) ||
    all_elements_in_diag1_have_same_char?(board, character) ||
    all_elements_in_diag2_have_same_char?(board, character)
end

def are_all_squares_filled?(board)
  filled_squares = 0

  for row in 0..2
    for col in 0..2
      filled_squares += 1 if TicTacToeMaster::ALLOWED_USER_INPUT_CHARACTERS.include?( board[row][col] )
    end
  end

  filled_squares == 9
end

def is_next_move_possible?(board)
  !are_all_squares_filled?(board)
end
