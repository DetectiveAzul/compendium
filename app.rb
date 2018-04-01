require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/spell')

get "/" do
  erb(:root)
end
