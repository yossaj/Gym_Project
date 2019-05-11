require_relative('../db/sql_runner.rb')
require('pg')
# require('pry')

class Booking

  attr_reader  :id
  attr_accessor :class_id, :member_id

  def initialize(options)
    @id = options['id'].to_i
    @class_id = options['class_id'].to_i
    @member_id = options['member_id'].to_i
  end

  def check_capacity
    sql ="SELECT capacity
          FROM bookings
          JOIN classes on classes.id = bookings.class_id
          WHERE class_id = $1;"
    values = [@class_id]

    result = SqlRunner.run(sql,values)
    return 0 if result.first == nil
    result.first['capacity'].to_i
  end

  def how_many_attending_class
    sql = "SELECT members.*
          FROM members
          INNER JOIN bookings ON members.id = bookings.member_id
          INNER JOIN classes ON classes.id = bookings.class_id
          WHERE bookings.class_id = $1"
    values = [@class_id]
    results =  SqlRunner.run(sql, values)
    results.count
  end

  def verify
    check_capacity > how_many_attending_class
  end



  def save
    sql = "INSERT INTO bookings( class_id, member_id )
          VALUES ($1, $2) RETURNING id"
    values = [@class_id, @member_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

def cap_save
  if how_many_attending_class == 0 || (check_capacity > how_many_attending_class)
    save
  else

    return false
  end
end

  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def class_type
    sql = "SELECT type FROM classes
          JOIN bookings  ON classes.id = bookings.class_id
          WHERE class_id = $1"
    values = [@class_id]
    result = SqlRunner.run(sql, values)
    result.first['type']
  end

  def all_classes
    sql = "SELECT * FROM classes"
    results = SqlRunner.run(sql)
    classes = results.map{|fclass|FitClass.new(fclass)}
  end

  def member_name
    sql = "SELECT name FROM members
          JOIN bookings  ON members.id = bookings.member_id
          WHERE member_id = $1"
    values = [@member_id]
    result = SqlRunner.run(sql, values)
    result.first['name']
  end


  def update
    sql = "UPDATE bookings SET (class_id, member_id) = ($1, $2)
           WHERE id = $3;"
    values = [@class_id,@member_id, @id]
    SqlRunner.run(sql, values)
  end

  def show_booking_by_name
    sql = "SELECT classes.*, members.*,bookings.id as booking_id,
          bookings.class_id, bookings.member_id
          FROM members INNER JOIN bookings
          ON members.id = bookings.member_id
          INNER JOIN classes ON classes.id = bookings.class_id
          WHERE bookings.id = $1"
    values = [@id]
    results = SqlRunner.run(sql,values)
    all_bookings = results.map
  end


  def self.find(id)
    sql = 'SELECT * FROM bookings WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql,values)
    booking = result.map{|booking| Booking.new(booking)}
    booking[0]
  end


  def self.find_by_class(class_id)
    sql = 'SELECT * FROM bookings WHERE class_id = $1'
    values = [class_id]
    result = SqlRunner.run(sql,values)
    booking = result.map{|booking| Booking.new(booking)}
    booking.first
  end

  def self.delete_all
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = 'SELECT * FROM bookings'
    results = SqlRunner.run(sql)
    all_bookings = results.map{|booking| Booking.new(booking)}
    all_bookings
  end

  def self.show_all_by_name()
    sql = "SELECT classes.*, members.*,bookings.id as booking_id
          FROM members INNER JOIN bookings
          ON members.id = bookings.member_id
          INNER JOIN classes ON classes.id = bookings.class_id "
    results = SqlRunner.run(sql)
    all_bookings = results.map
  end


end
