class SpellSlot
  attr_reader :id, :character_id
  attr_accessor :level, :quantity
  def initialize(options)
    @id = options['id'].to_i unless options['id'] == nil
    @character_id = options['character_id'].to_i
    @level = options['id'].to_i
    @quantity = options['quantity'].to_i
  end

  def self.all()
    sql = "SELECT * FROM spell_slots"
    spell_slots = SqlRunner.run(sql)
    return spell_slots.map { |spell_slot| SpellSlot.new(spell_slot) }
  end

  def self.delete_all()
    sql = "DELETE FROM spell_slots"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM spell_slots
    WHERE id = $1"
    values = [id]
    spell_slot = SqlRunner.run(sql, values)
    return SpellSlot.new(spell_slot.first) unless spell_slot.first == nil
  end

  def save()
    sql = "INSERT INTO spell_slots
    ( character_id, level, quantity )
    VALUES
    ( $1, $2, $3 )
    RETURNING id"
    values = [@character_id, @level, @quantity]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

end
