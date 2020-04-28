require_relative('../game_status_fetcher')

def calc_all_possible_opponent_moves(board)

  all_possible_moves = []

  for i in 0..2
    for j in 0..2

      if !(TicTacToeMaster::ALLOWED_USER_INPUT_CHARACTERS.include? (board[i][j]))
        all_possible_moves.push( {x: i, y: j} )
      end
    end
  end

  all_possible_moves
end

def get_opponent_char(my_char)
  case my_char
    when 'X'
      return 'O'
    when 'O'
      return 'X'
  end
end

def get_winning_opponent_move(board, my_char)
  opponent_char = get_opponent_char(my_char)
  all_possible_opponent_moves = calc_all_possible_opponent_moves(board)

  all_possible_opponent_moves.each do |possible_move|
    # dup does not work here. We need deep_dup
    dup_board = Marshal.load(Marshal.dump(board))

    dup_board[ possible_move[:x] ][ possible_move[:y] ] = opponent_char

    if has_won?(dup_board, opponent_char)
      puts '======== dup_board ==========='
      puts dup_board
      return possible_move
    end
  end

  nil
end

def get_move2(board, my_char)
  puts "Fetching next move using dumb_move2()..."

  for i in 0..2
    for j in 0..2
      winning_opponent_move = get_winning_opponent_move(board, my_char)
      if winning_opponent_move
        puts "winning_opponent_move = #{winning_opponent_move}"
        return winning_opponent_move
      end

      if !(TicTacToeMaster::ALLOWED_USER_INPUT_CHARACTERS.include? (board[i][j]))
        return {x: i, y: j}
      end
    end
  end
end
