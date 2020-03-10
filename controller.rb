require('sinatra')
require('sinatra/contrib/all')

require_relative('models/film')
also_reload('.models/*')

get '/films' do
  erb(:index)
end

get '/films/parasite' do
  erb(:index)
end
