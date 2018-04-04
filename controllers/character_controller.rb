require_relative('../models/character')
require_relative('../models/fixed_choices')

#index
get '/characters' do
  @characters = Character.all()
  erb(:"/characters/index")
end

#new
get '/characters/new' do
  @classes = FixedChoices.classes()
  erb(:"/characters/new")
end

#Return an error if name is repeated
get '/chracters/new/error' do
  @error = "Name already exists on the database"
  @classes = FixedChoices.classes()
  erb(:"/characters/new")
end

#create
post '/characters' do
  character = Character.new(params)
  redirect "/chracters/new/error" if character.repeated_name?() == true
  character.save()
  redirect "/characters/#{character.id}"
end

#show
get '/characters/:id' do
  @character = Character.find(params['id'].to_i)
  @spellbooks = @character.spellbooks()
  @spells = @character.spells()
  erb(:"/characters/show")
end

#edit
get '/characters/:id/edit' do
  @character = Character.find(params['id'].to_i)
  @classes = FixedChoices.classes()
  erb(:"/characters/edit")
end

#Invalids editing if repeated name
get '/characters/:id/edit/error' do
  @character = Character.find(params['id'].to_i)
  @classes = FixedChoices.classes()
  @error = "Name already exists on the database"
  erb(:"/characters/edit")
end

#update
post '/characters/:id' do
  character = Character.new(params)
  redirect "/characters/#{params['id']}/edit/error" if character.repeated_name? == true
  character.update()
  redirect "/characters/#{params['id']}"

end


#delete
post '/characters/:id/delete' do
  character = Character.find(params[:id].to_i)
  character.delete()
  redirect '/characters'
end
