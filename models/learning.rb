require_relative('spellbook')
require_relative('spell')
class Learning
  attr_reader :id, :spell_id, :spellbook_id
  def initialize(options)
    @id = options['id'].to_i unless options['id'] == nil
    @spell_id = options['spell_id'].to_i
    @spellbook_id = options['spellbook_id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM learnings"
    learnings = SqlRunner.run(sql)
    return learnings.map { |learning| Learning.new(learning) }
  end

  def self.delete_all()
    sql = "DELETE FROM learnings"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM learnings
    WHERE id = $1"
    values = [id]
    learning = SqlRunner.run(sql, values)
    return Learning.new(learning.first) unless learning.first == nil
  end

  def save()
    sql = "INSERT INTO learnings
    ( spell_id, spellbook_id )
    VALUES
    ( $1, $2 )
    RETURNING id"
    values = [@spell_id, @spellbook_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def delete()
    sql = "DELETE FROM learnings
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE learnings
    SET
    (spell_id, spellbook_id)
    =
    ($1, $2)
    WHERE id = $3"
    values = [@spell_id, @spellbook_id, @id]
    SqlRunner.run(sql, values)
  end

  def spell()
    sql = "SELECT * FROM spells
    WHERE spells.id = $1"
    values = [@spell_id]
    result = SqlRunner.run(sql, values)
    return Spell.new(result.first) unless result.first == nil
  end

  def spellbook()
    sql = "SELECT * FROM spellbooks
    WHERE spellbooks.id = $1"
    values = [@spellbook_id]
    result = SqlRunner.run(sql, values)
    return Spellbook.new(result.first) unless result.first == nil
  end

end
