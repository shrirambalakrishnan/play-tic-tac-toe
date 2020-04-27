def are_board_dimensions_valid?(board)
  return false if board.size != 3
  board.each { |row| return false if row.size != 3 }

  true
end

def are_board_chars_valid?(board)
  board.each do |row|
    row.each do |col|
      return false unless TicTacToeMaster::ALLOWED_CHARACTERS.include?(col)
    end
  end

  true
end

def get_validation_status(board)
  # 1. Validate if this is a 3*3 board
  # 2. Validate if the characters in board are ALLOWED_CHARACTERS
  return {status: false, msg: 'Board dimensions are not 3*3.'} unless are_board_dimensions_valid?(board)
  return {status: false, msg: 'Invalid characters present in board.' } unless are_board_chars_valid?(board)
  return {status: true}
end
