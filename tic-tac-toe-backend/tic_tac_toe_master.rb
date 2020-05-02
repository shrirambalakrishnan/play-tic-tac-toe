require('./board_validations')
require('./game_status_fetcher')

require("./moves/approach1")
require("./moves/approach2")
require("./moves/approach3_minimax.rb")

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
    return {status_msg: validation_status[:msg]} unless validation_status[:status]

    game_status = get_game_status(board)
    return {status_msg: game_status[:status_msg]} if game_status[:status] == "complete"

    get_next_move
  end

  private
    def get_next_move
      # get_move1(board)
      start_time = Time.now

      next_move_response = get_move(board, character)

      end_time = Time.now

      puts "========== RESPONSE ============="

      puts "optimal move = (#{next_move_response[:x]}, #{next_move_response[:y]})"

      puts "optimal score = #{next_move_response[:score]}"

      puts "Time taken = #{end_time - start_time}"

      next_move_response
    end
end
