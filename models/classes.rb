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

def delete()
  sql = "DELETE FROM classes WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql,values)
end

def update()
 sql = "UPDATE classes SET (type, time) = ($1, $2)
        WHERE id = $3;"
 values = [@type, @time, @id]
 SqlRunner.run(sql, values)
end

def self.find(id)
  sql = 'SELECT * FROM classes WHERE id = $1'
  values = [id]
  result = SqlRunner.run(sql,values)
  fitclass = result.map{|fclass| FitClass.new(fclass)}
end

def self.find_by_type(type)
sql =" SELECT * FROM classes WHERE type = $1"
values = [type]
result = SqlRunner.run(sql, values)
fitclass = result.map{|fclass| FitClass.new(fclass)}
end

def who_registered_for_class
  sql = "SELECT members.*
        FROM members
        INNER JOIN bookings ON members.id = bookings.member_id
        INNER JOIN classes ON classes.id = bookings.class_id
        WHERE bookings.class_id = $1"
  values = [@id]
  results =  SqlRunner.run(sql, values)
  attending = results.map{|member| Member.new(member)}
end

def self.delete_all()
  sql = "DELETE FROM classes"
  SqlRunner.run(sql)
end

def self.all()
  sql = 'SELECT * FROM classes'
  results = SqlRunner.run(sql)
  all_classes = results.map{|fit_class| FitClass.new(fit_class)}
  all_classes
end

end
