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
    Ship.methods(false).each do |ship|
      location = params[ship].upcase!.to_sym
      direction = params[(ship.to_s+'loc').to_sym]
      dir = :vertically if direction == 'v'
      dir = :horizontally if direction == 'h'
      #byebug
      @test = session[:p1]
      if session[:p1] == GAME.player1.name
        GAME.player1.board.place(Ship.send(ship),location,dir)
      else
        GAME.player2.board.place(Ship.send(ship),location,dir)
      end

    end
    erb :confo
  end

  get '/test' do
    puts GAME
    "hi"
  end

  get '/maingame' do
    @player1 = params[:name]

    @allowed_ships = Ship.methods(false)
    @locations = Array.new(@allowed_ships.count)
    @directions = Array.new(@allowed_ships.count)

    if session[:p1] == nil
      session[:p1] = @player1

      p1 = Player.new
      p1.name=session[:p1]
      GAME.player1 = p1
      GAME.player1.board = Board.new(Cell)

      erb :maingame

    elsif session[:p2] == nil
      session[:p2] = @player1

      p2 = Player.new
      p2.name=session[:p2]
      GAME.player2 = p2
      GAME.player2.board = Board.new(Cell)

      erb :maingame

    else
        erb :toolate
    end
    #
    # @p1 = session[:p1]
    # @p2 = session[:p2]

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
