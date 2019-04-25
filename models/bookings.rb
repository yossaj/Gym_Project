require_relative('./db/sql_runner.rb')

class Booking

  attr_reader :class_id, :member_id, :id

  def initalize(options)
    @id = opttions['id'].to_i
    @class_id = options['class_id'].to_i
    @membership_type = options['membership_id'].to_i
  end


end
