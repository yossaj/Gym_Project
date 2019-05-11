require_relative('../db/sql_runner.rb')
require('pg')
# require('pry')

class FitClass

  attr_reader  :id
  attr_accessor :type, :time, :date, :capacity, :tier

  def initialize(options)
    @id = options['id'].to_i
    @type = options['type']
    @time = options['time']
    @date = options['date']
    @capacity = options['capacity'].to_i
    @tier = options['tier']
  end

def save
  sql = "INSERT INTO classes( type, time, date, capacity, tier )
        VALUES ($1, $2, $3, $4, $5) RETURNING id"
  values = [@type, @time, @date, @capacity, @tier]
  result = SqlRunner.run(sql, values)
  @id = result.first['id']
end

def delete()
  sql = "DELETE FROM classes WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql,values)
end

def update()
 sql = "UPDATE classes SET (type, time, date, capacity, tier) = ($1, $2, $3, $4, $5)
        WHERE id = $6;"
 values = [@type, @time, @date, @capacity, @tier, @id]
 SqlRunner.run(sql, values)
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

def convert_date
  @date.split('-')
end

def date_as_day
  date_array = convert_date
  as_day = Time.new(date_array[0],date_array[1], date_array[2])
  as_day.strftime("%A")
end

def date_as_written
  date_array = convert_date
  as_day = Time.new(date_array[0],date_array[1], date_array[2])
  as_day.strftime("%A, %d of %B, %Y")
end


def self.find(fclass)
  sql = 'SELECT * FROM classes WHERE id = $1'
  values = [fclass]
  result = SqlRunner.run(sql,values).first
  ask_class = FitClass.new(result)
end

def self.find_by_type(type)
sql =" SELECT * FROM classes WHERE type = $1"
values = [type]
result = SqlRunner.run(sql, values)
fitclass = result.map{|fclass| FitClass.new(fclass)}
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


def self.up_coming()
sql = "SELECT classes.* FROM classes WHERE time > CURRENT_TIME and date = CURRENT_DATE"
results = SqlRunner.run(sql)
uc_class =results.map{|fclass| FitClass.new(fclass)}
uc_class
end

def self.up_coming_by_date_seven
  sql = "SELECT classes.* FROM classes
        WHERE date >= CURRENT_DATE AND date < CURRENT_DATE + 7
        ORDER BY date ASC"
  results = SqlRunner.run(sql)
  ucd_class =results.map{|fclass| FitClass.new(fclass)}
  ucd_class
end

def self.up_coming_by_date
  sql = "SELECT classes.* FROM classes
        WHERE date >= CURRENT_DATE
        ORDER BY date ASC"
  results = SqlRunner.run(sql)
  ucd_class =results.map{|fclass| FitClass.new(fclass)}
  ucd_class
end





end
