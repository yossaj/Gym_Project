require_relative('../db/sql_runner.rb')

class Booking

  attr_reader :class_id, :member_id, :id

  def initialize(options)
    @id = options['id'].to_i
    @class_id = options['class_id'].to_i
    @member_id = options['member_id'].to_i
  end

  def save
    sql = "INSERT INTO bookings( class_id, member_id )
          VALUES ($1, $2) RETURNING id"
    values = [@class_id, @member_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end



end
