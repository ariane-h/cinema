require('sinatra')
require('sinatra/contrib/all')

require_relative('models/film')
also_reload('.models/*')

get '/films' do
    films = Film.all.map {|film| Film.new(film)}
    @film1 = films[0]
    @film2 = films[1]
    @film3 = films[2]
  erb(:index)
end

get '/films/details/1' do
    film = Film.all.map {|film| Film.new(film)}
    film = film[0]
  erb(:details)
end

get '/films/details/2' do
  erb(:details)
end

get '/films/details/3' do
  erb(:details)
end
