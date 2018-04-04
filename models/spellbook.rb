require_relative('../db/sql_runner')
require_relative('character')
require_relative('learning')

class Spellbook
  attr_reader :id
  attr_accessor :name, :pages, :character_id, :description
  def initialize(options)
    @id = options['id'].to_i unless options['id'] == nil
    @name = options['name']
    @pages = options['pages'].to_i
    @description = options['description']
    @character_id = options['character_id'].to_i unless options['character_id'] == nil
  end

  def self.all()
    sql = "SELECT * FROM spellbooks
    ORDER BY id"
    spellbooks = SqlRunner.run(sql)
    return spellbooks.map { |spellbook| Spellbook.new(spellbook) }
  end

  def self.delete_all()
    sql = "DELETE FROM spellbooks"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM spellbooks
    WHERE id = $1"
    values = [id]
    spellbook = SqlRunner.run(sql, values)
    return Spellbook.new(spellbook.first) unless spellbook.first == nil
  end

  def save()
    sql = "INSERT INTO spellbooks
    ( name, pages, character_id, description )
    VALUES
    ( $1, $2, $3, $4 )
    RETURNING id"
    values = [@name, @pages, @character_id, @description]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def delete()
    sql = "DELETE FROM spellbooks
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE spellbooks
    SET
    (name, pages, character_id, description)
    =
    ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@name, @pages, @character_id, @description, @id]
    SqlRunner.run(sql, values)
  end

  #Return the owner of the spellbook
  def character()
    sql = "SELECT * FROM characters
    WHERE characters.id = $1"
    values = [@character_id]
    result = SqlRunner.run(sql, values)
    return Character.new(result.first) unless result.first == nil
  end

  #Return all the learnings related to this spellbook
  def learnings()
    sql = "SELECT * FROM learnings
    WHERE spellbook_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |learning| Learning.new(learning) } unless result == nil
  end

  #Return all the spells written on the book
  def spells()
    learnings = self.learnings()
    spells = learnings.map { |learning| learning.spell }
    return spells
  end

  #Return the count of the spells
  def spells_count()
    return self.spells.count()
  end
end
