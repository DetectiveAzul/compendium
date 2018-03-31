class Spell
  attr_reader :id
  attr_accessor :name, :school, :level, :pages, :description
  def initialize(options)
    @id = options['id'].to_i unless options['id'] == nil
    @name = options['name']
    @school = options['school']
    @level = options['level'].to_i
    @pages = options['level'].to_i
    @description = options['description']
  end

  def self.all()
    sql = "SELECT * FROM spells"
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
end
