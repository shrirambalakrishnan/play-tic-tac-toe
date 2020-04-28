def get_move1(board)
  puts "Fetching next move using dumb_move1()..."

  for i in 0..2
    for j in 0..2
      if !(TicTacToeMaster::ALLOWED_USER_INPUT_CHARACTERS.include? (board[i][j]))
        return {x: i, y: j}
      end
    end
  end
end
