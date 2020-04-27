class TicTacToeMaster
  attr_accessor :character, :board

  ALLOWED_CHARACTERS = ['X', 'O', '']
  ALLOWED_USER_INPUT_CHARACTERS = ['X', 'O']

  def initialize(board, character = "X")
    @character = your_character
    @board = board
  end

  def play
    validation_status = get_validation_status
    return validation_status[:msg] unless validation_status[:status]

    game_status = get_game_status
    return "Game is already over" if is_game_over?

    return "Game drawn" if is_draw?

    # TODO- Choose the next move.
  end

  private
    def are_board_dimensions_valid?
      return false if board.size != 3
      board.each { |row| return false if row.size != 3 }

      true
    end

    def are_board_chars_valid?
      board.each do |row|
        row.each do |col|
          return false unless ALLOWED_CHARACTERS.include?(col)
        end
      end

      true
    end

    def get_validation_status
      # 1. Validate if this is a 3*3 board
      # 2. Validate if the characters in board are ALLOWED_CHARACTERS
      return {status: false, msg: 'Board dimensions are not 3*3.'} unless are_board_dimensions_valid?
      return {status: false, msg: 'Invalid characters present in board.' } unless are_board_chars_valid??
      return { status: true }
    end

    def get_game_status
      return {status_msg: 'X Won the Game.', winner: 'X'} if has_won?('X')
      return {status_msg: 'O Won the Game.', winner: 'O'} if has_won?('O')
      return {status_msg: 'Game drawn.', winner: ''} unless is_next_move_possible?
    end

    def all_elements_in_row_have_same_char?(character)
      for row in 0..2
        does_all_elems_have_same_char = true

        for col in 0..2
          does_all_elems_have_same_char = does_all_elems_have_same_char && (board[row][col] == character)
        end

        return true if does_all_elems_have_same_char
      end

      false
    end

    def all_elements_in_col_have_same_char?(character)
      for col in 0..2
        does_all_elems_have_same_char = true

        for row in 0..2
          does_all_elems_have_same_char = does_all_elems_have_same_char && (board[row][col] == character)
        end

        return true if does_all_elems_have_same_char
      end

      false
    end


    def all_elements_in_diag1_have_same_char?(character)
      does_diagonal_1_have_same_char = true
      for i in 0..2
        does_diagonal_1_have_same_char = does_diagonal_1_have_same_char && (board[i][i] == character)
      end

      does_diagonal_1_have_same_char
    end

    def all_elements_in_diag2_have_same_char?(character)
      does_diagonal_2_have_same_char = true
      2.downto(0) do |i|
        does_diagonal_2_have_same_char = does_diagonal_1_have_same_char && (board[i][i] == character)
      end

      does_diagonal_2_have_same_char
    end


    def has_won?(character)
      # 1. row wise check
      # 2. col wise check
      # 3. Diagonal check - 1
      # 4. Diagonal check - 2

      all_elements_in_row_have_same_char?(character) ||
        all_elements_in_col_have_same_char?(character) ||
        all_elements_in_diag1_have_same_char?(character) ||
        all_elements_in_diag2_have_same_char?(character)
    end

    def are_all_squares_filled?
      filled_squares = 0

      for row in 0..2
        for col in 0..2
          filled_squares += 1 if ALLOWED_USER_INPUT_CHARACTERS.include?( board[row][col] )
        end
      end

      filled_squares == 9
    end

    def is_next_move_possible?
      !are_all_squares_filled?
    end


end
