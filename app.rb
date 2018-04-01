require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/spell_controller')
require_relative('controllers/character_controller')

get "/" do
  erb(:root)
end
