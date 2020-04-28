require 'sinatra'
require 'sinatra/cross_origin'
require 'json'
require './tic_tac_toe_master'

# routes...
options "*" do
  puts "tententen"

  response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end

post '/get_next_move' do
  response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"

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
