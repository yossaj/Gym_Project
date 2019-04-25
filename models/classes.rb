require_relative('./db/sql_runner.rb')

class Class

  attr_reader :type, :time, :id

  def initalize(options)
    @id = opttions['id'].to_i
    @type = options['type']
    @time = options['time']
  end


end
