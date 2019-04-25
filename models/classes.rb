require_relative('../db/sql_runner.rb')

class FitClass

  attr_reader  :id
  attr_accessor :type, :time

  def initialize(options)
    @id = options['id'].to_i
    @type = options['type']
    @time = options['time']
  end

def save
  sql = "INSERT INTO classes( type, time )
        VALUES ($1, $2) RETURNING id"
  values = [@type, @time]
  result = SqlRunner.run(sql, values)
  @id = result.first['id']
end



def update()
 sql = "UPDATE classes SET (type, time) = ($1, $2)
        WHERE id = $3;"
 values = [@type, @time, @id]
 SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM classes"
  SqlRunner.run(sql)
end

end
