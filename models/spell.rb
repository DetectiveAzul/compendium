class Spell
  attr_reader :id
  attr_accessor :name, :c_class, :school, :level, :pages, :description
  def initialize(options)
    @id = options['id'].to_i unless options['id'] == nil
    @name = options['name']
    @c_class = options['c_class']
    @school = options['school']
    @level = options['level'].to_i
    @pages = options['level'].to_i
    @description = options['description']
  end
end
