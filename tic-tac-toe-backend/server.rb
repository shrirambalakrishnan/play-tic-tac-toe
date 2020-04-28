require 'sinatra'
require 'json'
require './tic_tac_toe_master'

post '/get_next_move' do
  data = JSON.parse(request.body.read)
  puts "----------- data -----------"
  puts data
  puts '----------------------'


  puts "----------- data['board'] -----------"
  puts data['board']
  puts '----------------------'

  ttt_master = TicTacToeMaster.new(JSON.parse(data['board']), data['character'])

  ttt_master.play.to_json
end
