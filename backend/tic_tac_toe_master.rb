require('./board_validations')
require('./game_status_fetcher')

require("./moves/approach1")
require("./moves/approach2")

class TicTacToeMaster
  attr_accessor :character, :board

  ALLOWED_CHARACTERS = ['X', 'O', '']
  ALLOWED_USER_INPUT_CHARACTERS = ['X', 'O']

  def initialize(board, character = "X")
    @character = character
    @board = board
  end

  def play
    validation_status = get_validation_status(board)
    return validation_status[:msg] unless validation_status[:status]

    game_status = get_game_status(board)
    return game_status[:status_msg] if game_status[:status] == "complete"

    # TODO- Choose the next move.
    get_next_move
  end

  private
    def get_next_move
      # get_move1(board)
      get_move2(board, character)
    end
end
