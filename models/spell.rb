require_relative('../db/sql_runner')
require_relative('spellbook')

class Spell
  attr_reader :id
  attr_accessor :name, :school, :level, :pages, :description
  def initialize(options)
    @id = options['id'].to_i unless options['id'] == nil
    @name = options['name']
    @school = options['school']
    @level = options['level'].to_i
    @pages = options['pages'].to_i
    @description = options['description']
  end

  #Basic CRUD methods
  def self.all()
    sql = "SELECT * FROM spells
    ORDER BY level"
    spells = SqlRunner.run(sql)
    return spells.map { |spell| Spell.new(spell) }
  end

  def self.delete_all()
    sql = "DELETE FROM spells"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM spells
    WHERE id = $1"
    values = [id]
    spell = SqlRunner.run(sql, values)
    return Spell.new(spell.first) unless spell.first == nil
  end

  def save()
    sql = "INSERT INTO spells
    ( name, school, level, pages, description )
    VALUES
    ( $1, $2, $3, $4, $5)
    RETURNING id"
    values = [@name, @school, @level, @pages, @description]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def delete()
    sql = "DELETE FROM spells
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE spells
    SET
    (name, school, level, pages, description)
    =
    ($1, $2, $3, $4, $5)
    WHERE id = $6;"
    values = [@name, @school, @level, @pages, @description, @id]
    SqlRunner.run(sql, values)
  end

  #Return all the learnings connected to this specific spell
  def learnings()
    sql = "SELECT * FROM learnings
    WHERE spell_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |learning| Learning.new(learning) } unless result == nil
  end
end
