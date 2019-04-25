require_relative('./db/sql_runner.rb')

class Member

  attr_reader :name, :membership_type, :reg_date, :id
  
  def initalize(options)
    @id = opttions['id'].to_i
    @name = options['name']
    @membership_type = options['membership_type']
    @reg_date = options['reg_date']
  end


end
