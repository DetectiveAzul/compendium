class Character
  attr_reader :id
  attr_accessor :name, :level, :c_class, :writing_skill, :description
  def initialize(options)
    @id = options['id'].to_i unless options['id'] == nil
    @name = options['name']
    @level = options['level'].to_i
    @c_class = options['c_class']
    @description = options['description']
    @writing_skill = options['writing_skill'].to_i
  end

  def self.all()
    sql = "SELECT * FROM characters"
    characters = SqlRunner.run(sql)
    return characters.map { |character| Character.new(character) }
  end

  def self.delete_all()
    sql = "DELETE FROM characters"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM characters
    WHERE id = $1"
    values = [id]
    character = SqlRunner.run(sql, values)
    return Character.new(character.first) unless character.first == nil
  end

  def save()
    sql = "INSERT INTO characters
    ( name, level, c_class, description, writing_skill )
    VALUES
    ( $1, $2, $3, $4, $5 )
    RETURNING id"
    values = [@name, @level, @c_class,@description, @writing_skill]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def delete()
    sql = "DELETE FROM characters
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE characters
    SET
    (name, level, c_class, description, writing_skill)
    =
    ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@name, @level, @c_class, @description, @writing_skill, @id]
    SqlRunner.run(sql, values)
  end

  def spellbooks()
  end
  
end
