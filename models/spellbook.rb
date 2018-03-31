class Spellbook
  def initialize()
    @id = options['id'].to_i unless options['id'] == nil
    @name = options['name']
    @pages = options['pages'].to_i
    @character_id = options['character_id'].to_i
  end
end
