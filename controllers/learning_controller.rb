require_relative('../models/learning')
require_relative('../models/spellbook')
require_relative('../models/spell')

#index
get '/learnings' do
  @learnings = Learning.all()
  erb(:"/learnings/index")
end

#new
get '/learnings/new' do
  @spellbooks = Spellbook.all()
  @spells = Spell.all()
  erb(:"/learnings/new")
end

#create
post '/learnings/spells' do
  learning = Learning.new(params)
  learning.save()
  redirect "/spells/#{learning.spell_id}"
end

post '/learnings/spellbooks' do
  learning = Learning.new(params)
  learning.save()
  redirect "/spellbooks/#{learning.spellbook_id}"
end

#show
get '/learnings/:id' do
  @learning = Learning.find(params['id'].to_i)
  erb(:"/learnings/show")
end

#edit
get '/learnings/:id/edit' do
  @learning = Learning.find(params['id'].to_i)
  @spellbooks = Spellbook.all()
  @spells = Spell.all()
  erb(:"/learnings/edit")
end

#update
post '/learnings/:id' do
  learning = Learning.new(params)
  learning.update()
  redirect "/learnings/#{params['id']}"

end

#delete
post '/learnings/:id/delete' do
  learning = Learning.find(params[:id].to_i)
  learning.delete()
  redirect "/spells/#{learning.spell_id}"
end
