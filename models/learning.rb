class Learning
  attr_reader :id, :spell_id, :spellbook_id
  def initialize(options)
    @id = options['id'].to_i unless options['id'] == nil
    @spell_id = options['spell_id'].to_i
    @spellbook_id = spellbook_id['spellbook_id'].to_i
  end
end
