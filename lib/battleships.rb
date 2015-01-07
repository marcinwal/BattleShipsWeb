require 'sinatra/base'
require 'byebug'
require './lib/setup.rb'

class BattleShips < Sinatra::Base

  enable :sessions

  get '/' do
    session.clear
    erb :index
  end

  get '/newgame' do
    erb :newgame
  end

  get '/maingame' do
    @player1 = params[:name]

    @allowed_ships = Ship.methods(false)
    @locations = Array[@allowed_ships.count]
    @directions = dfbdfdfdf

    if session[:p1] == nil
      session[:p1] = @player1

      p1 = Player.new
      p1.name=session[:p1]
      b1 = Board.new(Cell)
      p1.board=b1

      erb :maingame

    elsif session[:p2] == nil
      session[:p2] = @player1

      p1 = Player.new
      p2.name=session[:p2]
      b2 = Board.new(Cell)
      p2.board=b2

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
