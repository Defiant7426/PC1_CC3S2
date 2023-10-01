require 'sinatra' 
require_relative 'word_guesser_game'

# class MyApp < Sinatra::Base 
# get '/' do 
# "<!DOCTYPE html><html><head></head><body><h1>Otro Mensaje</h1></body></html>" 
# end 
# end

enable :sessions

post '/create' do
	session[:game] = WordGuesserGame.new('palabra_aleatoria')
	redirect '\show'
end

post '/show' do
	@game = session[:game]
	erb :show
end

post '/guess' do
	@game = session[:game]
	@game.guess(params[:letter])
	session[:game] = @game
	redirect '/show'
end

