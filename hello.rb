require 'sinatra'

get '/' do
  'hello!'
end

get '/' do
  @name = %w(Marcin Olo King).sample
  erb :index 
end 

get '/secret' do
  'This is a secret page'
end

get '/hello' do
  @visitor = params[:name]
  erb :index
end

