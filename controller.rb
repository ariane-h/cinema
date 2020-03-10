require('sinatra')
require('sinatra/contrib/all')

require_relative('models/film')
also_reload('.models/*')

get '/films' do
  list = Film.all.map {|film| Film.new(film)}
  @films = list.map {|film| film.title} 
  erb(:index)
end
