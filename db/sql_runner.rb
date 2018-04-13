require('pg')
#This class allows us to run SQL code
class SqlRunner
  def self.run(sql, values = [])
    begin
      db = PG.connect({
        dbname: 'dbc9gs5qeprkkd',
        host: 'ec2-54-235-109-37.compute-1.amazonaws.com',
        port: 5432,
        user: 'xiswkzudmpbrxl',
        password: '8fac9c6aee98c48076bdc024d8caf3f9744d493e07763be2674a9ad165678833'
        })
      # db = PG.connect({ dbname: 'dnd_compendium', host: 'localhost' })
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() unless db == nil
    end
    return result
  end
end
