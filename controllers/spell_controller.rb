require_relative('../models/spell')
require_relative('../models/fixed_choices')
require_relative('../models/spellbook')

#index
get '/spells' do
  @spells = Spell.all()
  erb(:"/spells/index")
end

#new
get '/spells/new' do
  @schools = FixedChoices.schools()
  erb(:"/spells/new")
end

#error if spell repeated
get '/spells/new' do
  @error = "Spell Name already exists on the database"
  @schools = FixedChoices.schools()
  erb(:"/spells/new")
end

#create
post '/spells' do
  spell = Spell.new(params)
  redirect "/spells/new/error" if spell.repeated_name?() == true
  spell.save()
  redirect "/spells/#{spell.id}"
end

#show
get '/spells/:id' do
  @spell = Spell.find(params['id'].to_i)
  @learnings = @spell.learnings()
  @spellbooks = Spellbook.all()
  erb(:"/spells/show")
end

#invalid learning if spell is going to be repeated
get '/spells/:id/error' do
  @spell = Spell.find(params['id'].to_i)
  @learnings = @spell.learnings()
  @spellbooks = Spellbook.all()
  @error = "This spell is already on the spellbook"
  erb(:"/spells/show")
end

#edit
get '/spells/:id/edit' do
  @spell = Spell.find(params['id'].to_i)
  @schools = FixedChoices.schools()
  erb(:"/spells/edit")
end

get '/spells/:id/edit/error' do
  @spell = Spell.find(params['id'].to_i)
  @schools = FixedChoices.schools()
  @error =  "Spell Name is already in the database"
  erb(:"/spells/edit")
end

#update
post '/spells/:id' do
  spell = Spell.new(params)
  redirect "/spells/#{params['id']}/edit/error" if spell.repeated_name? == true
  spell.update()
  redirect "/spells/#{params['id']}"
end


#delete

post '/spells/:id/delete' do
  spell = Spell.find(params[:id].to_i)
  spell.delete()
  redirect '/spells'
end
