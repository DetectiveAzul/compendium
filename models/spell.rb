class Spell
  def initialize(options)
    @id = options['id'].to_i unless options['id'] == nil
    @name = options['name']
    @c_class = options['class']
    @school = options['school']
    @level = options['level'].to_i
    @pages = options['level'].to_i
    @description = options['description']
  end
end
