require 'sinatra/base'
require 'byebug'
require './lib/setup.rb'

class BattleShips < Sinatra::Base

  enable :sessions

  GAME = Game.new

  get '/' do
    session.clear
    erb :index
  end

  get '/newgame' do
    erb :newgame
  end

  get '/confo' do

    @id = session[:id]
    

    @status = GAME.ready? ? "enable" : "disabled"

    Ship.methods(false).each do |ship|
      location = params[ship].upcase!.to_sym
      direction = params[(ship.to_s+'loc').to_sym]
      dir = :vertically if direction == 'v'
      dir = :horizontally if direction == 'h'
      #byebug
      if @id == GAME.player1.object_id
        GAME.player1.board.place(Ship.send(ship),location,dir) unless GAME.player1.board.ships_count == Ship.methods(false).count
      else
        GAME.player2.board.place(Ship.send(ship),location,dir) unless GAME.player2.board.ships_count == Ship.methods(false).count
        @status = "enable"
      end
    end
    erb :confo
  end

  get '/game' do
    @player = session[:p]
    @id = session[:id]
    puts GAME
    erb :game
  end

  get '/maingame' do
    @player1 = params[:name]

    @allowed_ships = Ship.methods(false)
    @locations = Array.new(@allowed_ships.count)
    @directions = Array.new(@allowed_ships.count)
    session[:p] = @player1

    if !GAME.ready?
      player = Player.new
      player.name = @player1
      player.board = Board.new(Cell)
      GAME.add_player(player)
      session[:id] = player.object_id
      erb :maingame

    else
        erb :toolate
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
