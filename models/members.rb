require_relative('../db/sql_runner.rb')

class Member

  attr_reader :name, :membership_type, :reg_date, :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @membership_type = options['membership_type']
    @reg_date = options['reg_date']
  end

  def save
    sql = "INSERT INTO members( name, membership_type, registration_date )
          VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @membership_type, @reg_date]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end



end
