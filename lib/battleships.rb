require 'sinatra/base'


class BattleShips < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/newgame' do
    erb :newgame
  end

  get '/maingame' do
    @player1 = params[:name]
    @p1 = @player1 if @p1==""
    @p2 = @player1 unless @p1==""
    erb :maingame
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
