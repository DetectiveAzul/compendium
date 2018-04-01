require_relative('../models/spell')
require_relative('../models/fixed_choices')

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

#create
post '/spells' do
  Spell.new(params).save()
  redirect '/spells'
end

#show
get '/spells/:id' do
  @spell = Spell.find(params['id'].to_i)
  erb(:"/spells/show")
end

#edit
get '/spells/:id/edit' do
  @spell = Spell.find(params['id'].to_i)
  @schools = FixedChoices.schools()
  erb(:"/spells/edit")
end

#update
post '/spells/:id' do
  spell = Spell.new(params)
  spell.update()
  redirect "/spells/#{params['id']}"

end


#delete

post '/spells/:id/delete' do
  spell = Spell.find(params[:id].to_i)
  spell.delete()
  redirect '/spells'
end
