require_relative('../db/sql_runner.rb')
require('pry')

class Member

  attr_reader  :id
  attr_accessor :name, :membership_type, :registration_date

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @membership_type = options['membership_type']
    @registration_date = options['registration_date']
  end

  def save
    sql = "INSERT INTO members( name, membership_type, registration_date )
          VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @membership_type, @registration_date]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

  def update()
   sql = "UPDATE members SET (name, membership_type, registration_date) = ($1, $2, $3)
          WHERE id = $4;"
   values = [@name, @membership_type, @registration_date, @id]
   SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.find(member)
    sql = 'SELECT * FROM members WHERE id = $1'
    values = [member]
    result = SqlRunner.run(sql,values).first
    return Member.new(result)
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM members WHERE name = $1"
    values = [name]
    result = SqlRunner.run(sql,values)
    member = result.map{|member| Member.new(member)}
  end

  def self.find_by_membership_type(membership_type)
    sql = "SELECT * FROM members WHERE membership_type = $1"
    values = [membership_type]
    result = SqlRunner.run(sql,values)
    member = result.map{|member| Member.new(member)}
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
