# Minimax - minimize the maximum score possible for the opponent
require_relative('./game_status_fetcher')

def get_opponent_char( char )
  case char
    when 'X'
      return 'O'
    when 'O'
      return 'X'
    end
end

def get_move(board, char, computer_player_char = 'X')
  if are_all_squares_filled?(board)
    return {x: -1, y: -1, score: 0};
  end

  puts "board = #{board}"
  puts "-------------- char = #{char} --------------"
  optimal_move = {x: -10000, y: -10000}
  optimal_score = (computer_player_char == char ? -10000 : 10000)

  for i in 0..2

    for j in 0..2
      puts "(i, j) = (#{i}, #{j})..."

      if !(TicTacToeMaster::ALLOWED_USER_INPUT_CHARACTERS.include? (board[i][j]))
        new_board = Marshal.load(Marshal.dump(board))
        new_board[i][j] = char

        if(has_won?(new_board, char))
          return {x: -2, y: -2, score: (computer_player_char == char ? 1 : -1)};
        end

        score = get_move(new_board, get_opponent_char(char))[:score]

        if char == computer_player_char
          if score > optimal_score
            optimal_score = score
            optimal_move = { x: i, y: j }
          end

        else
          if score < optimal_score
            optimal_score = score
            optimal_move = { x: i, y: j }
          end
        end

      end
    end
  end

  return {x: optimal_move[:x], y: optimal_move[:y], score: optimal_score}
end
