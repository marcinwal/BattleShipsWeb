require 'sinatra/base'
require 'byebug'

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

    if session[:p1] == nil
      session[:p1] = @player1
      erb :maingame
    elsif session[:p2] == nil
      session[:p2] = @player1
      erb :maingame
    else
        erb :toolate    
    end    
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
