class Learning
  def initialize()
    @id = options['id'].to_i unless options['id'] == nil
    @spell_id = options['spell_id'].to_i
    @spellbook_id = spellbook_id['spellbook_id'].to_i
  end
end
