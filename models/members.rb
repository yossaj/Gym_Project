require_relative('../db/sql_runner.rb')

class Member

  attr_reader  :id, :reg_date
  attr_accessor :name, :membership_type

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

  def update()
   sql = "UPDATE members SET (name, membership_type, registration_date) = ($1, $2, $3)
          WHERE id = $4;"
   values = [@name, @membership_type, @reg_date, @id]
   SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = 'SELECT * FROM members'
    results = SqlRunner.run(sql)
    all_mems = results.map{|member| Member.new(member)}
    all_mems
  end



end
