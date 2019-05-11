require 'bundler/setup'
Bundler.require

configure :development do
  ENV['SINATRA_ENV'] ||= "development"

  ActiveRecord::Base.establish_connection(
    :adapter => "pg",
    :database => "db/gym.sql"
  )
end

configure :production do
  db = URI.parse(ENV['postgres://vmhrxihdrrqyqd:84539ed6de439fae026a21200576ca6d6f2367f4a431327fe8347d7c3f8b2267@ec2-50-17-231-192.compute-1.amazonaws.com:5432/d2r59mqh242ojj'] || 'postgres://localhost/gym')

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

require_all 'app'
