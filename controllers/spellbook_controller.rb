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

#Invalid creation if name already in the database
get '/spellbooks/new' do
  @error = "Name already exists on the database"
  @characters = Character.all()
  erb(:"/spellbooks/new")
end


#create
post '/spellbooks' do
  spellbook = Spellbook.new(params)
  redirect "/spellbooks/new/error" if spellbook.repeated_name?() == true
  spellbook.save()
  redirect "/spellbooks/#{spellbook.id}"
end

#show
get '/spellbooks/:id' do
  @spellbook = Spellbook.find(params['id'].to_i)
  @spells = @spellbook.spells()
  @compendium = Spell.all()
  @learnings = @spellbook.learnings()
  erb(:"/spellbooks/show")
end

#Error if book already contains the spell during a new learning
get '/spellbooks/:id/error' do
  @spellbook = Spellbook.find(params['id'].to_i)
  @spells = @spellbook.spells()
  @compendium = Spell.all()
  @learnings = @spellbook.learnings()
  @error = "This book already contains the spell"
  erb(:"/spellbooks/show")
end

#edit
get '/spellbooks/:id/edit' do
  @spellbook = Spellbook.find(params['id'].to_i)
  @characters = Character.all()
  erb(:"/spellbooks/edit")
end

#Returns an error if name is already on the database
get '/spellbooks/:id/edit/error' do
  @spellbook = Spellbook.find(params['id'].to_i)
  @characters = Character.all()
  @error = "Name already exists on the database"
  erb(:"/spellbooks/edit")
end

#update
post '/spellbooks/:id' do
  spellbook = Spellbook.new(params)
  redirect "/spellbooks/#{params['id']}/edit/error" if spellbook.repeated_name? == true
  spellbook.update()
  redirect "/spellbooks/#{params['id']}"

end

#delete
post '/spellbooks/:id/delete' do
  spellbook = Spellbook.find(params[:id].to_i)
  spellbook.delete()
  redirect '/spellbooks'
end
