class Spellbook
  attr_reader :id
  attr_accessor :name, :pages, :character_id
  def initialize(options)
    @id = options['id'].to_i unless options['id'] == nil
    @name = options['name']
    @pages = options['pages'].to_i
    @character_id = options['character_id'].to_i
  end
end
