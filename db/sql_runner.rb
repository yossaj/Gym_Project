require('pg')
class SqlRunner

  def self.run(sql, values = [])
    begin
    db = PG.connect({dbname: 'd2r59mqh242ojj',
                    host: 'ec2-50-17-231-192.compute-1.amazonaws.com',
                    user:'vmhrxihdrrqyqd',
                    password:'84539ed6de439fae026a21200576ca6d6f2367f4a431327fe8347d7c3f8b2267'})
    db.prepare("query", sql)
    result = db.exec_prepared('query',values)
    ensure
      db.close if db != nil
    end
  end

end
