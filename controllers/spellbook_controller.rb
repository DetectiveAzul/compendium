require_relative('../models/spellbook')
require_relative('../models/character')
#index
get '/spellbooks' do
  @spellbooks = Spellbook.all()
  erb(:"/spellbooks/index")
end

#new
get '/spellbooks/new' do
  @characters = Character.all()
  erb(:"/spellbooks/new")
end

#create
post '/spellbooks' do
  spellbook = Spellbook.new(params)
  spellbook.save()
  redirect "/spellbooks/#{spellbook.id}"
end

#show
get '/spellbooks/:id' do
  @spellbook = Spellbook.find(params['id'].to_i)
  erb(:"/spellbooks/show")
end

#edit
get '/spellbooks/:id/edit' do
  @spellbook = Spellbook.find(params['id'].to_i)
  @characters = Character.all()
  erb(:"/spellbooks/edit")
end

#update
post '/spellbooks/:id' do
  spellbook = Spellbook.new(params)
  spellbook.update()
  redirect "/spellbooks/#{params['id']}"

end

#delete
post '/spellbooks/:id/delete' do
  spellbook = Spellbook.find(params[:id].to_i)
  spellbook.delete()
  redirect '/spellbooks'
end
