require 'sinatra/base'

class BattleShips < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/newgame' do
    erb :newgame
  end

  get '/maingame' do
    @player1 = params[:name]

    session[:p1] = @player1 if session[:p1] == nil
    session[:p2] = @player1 unless session[:p1] == nil

    if !session[:p1] && !session[:p2]
      erb :tolate
    else
      erb :maingame
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
