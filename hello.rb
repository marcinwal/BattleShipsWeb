require 'sinatra'

get '/' do
  @name = %w(Marcin Olo King).sample
  erb :index 
end 

get '/secret' do
  erb :secret
end

get '/hello' do
  @visitor = params[:name]
  erb :index
end

