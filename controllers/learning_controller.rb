require_relative('../models/learning')
require_relative('../models/spellbook')
require_relative('../models/spell')


#create from spells
post '/learnings/spells' do
  learning = Learning.new(params)
  redirect "/spells/#{learning.spell_id}/error" if learning.spell_repeated? == true
  learning.save()
  redirect "/spells/#{learning.spell_id}"
end

#create from spellbooks
post '/learnings/spellbooks' do
  learning = Learning.new(params)
  redirect "/spellbooks/#{learning.spellbook_id}/error" if learning.spell_repeated? == true
  learning.save()
  redirect "/spellbooks/#{learning.spellbook_id}"
end

#delete from spells
post '/learnings/:id/delete/spells' do
  learning = Learning.find(params[:id].to_i)
  learning.delete()
  redirect "/spells/#{learning.spell_id}"
end

#delete from spellbooks
post '/learnings/:id/delete/spellbooks' do
  learning = Learning.find(params[:id].to_i)
  learning.delete()
  redirect "/spellbooks/#{learning.spellbook_id}"
end
