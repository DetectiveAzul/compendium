class SpellSlot
  attr_reader :id, :character_id
  attr_accessor :level, :quantity
  def initialize(options)
    @id = options['id'].to_i unless options['id'] == nil
    @character_id = options['character_id'].to_i
    @level = options['id'].to_i
    @quantity = options['quantity'].to_i
  end
end
