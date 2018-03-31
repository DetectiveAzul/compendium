class Spellbook
  attr_reader :id
  attr_accessor :name, :pages, :character_id
  def initialize(options)
    @id = options['id'].to_i unless options['id'] == nil
    @name = options['name']
    @pages = options['pages'].to_i
    @character_id = options['character_id'].to_i unless options['character_id'] == nil
  end

  def self.all()
    sql = "SELECT * FROM spellbooks"
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
    ( name, pages, character_id )
    VALUES
    ( $1, $2, $3 )
    RETURNING id"
    values = [@name, @pages, @character_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end
end
