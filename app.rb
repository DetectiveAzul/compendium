require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('controllers/spell_controller')
require_relative('controllers/character_controller')
require_relative('controllers/spellbook_controller')
require_relative('controllers/learning_controller')

get "/" do
  erb(:root)
end

get "/about" do
  erb(:about)
end

not_found do
  status 404
  erb :oops, :layout => :oops
end
