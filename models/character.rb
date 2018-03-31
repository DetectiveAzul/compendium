class Character
  attr_reader :id
  attr_accessor :name, :level, :c_class, :writing_skill
  def initialize(options)
    @id = options['id'].to_i unless options['id'] == nil
    @name = options['name']
    @level = options['level'].to_i
    @c_class = options['class']
    @writing_skill = options['writing_skill'].to_i
  end
end
