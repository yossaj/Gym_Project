require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/bookings.rb' )
require_relative( '../models/classes.rb' )
require_relative( '../models/members.rb' )
also_reload( '../models/*' )

get '/members' do
  @members = Member.all()
  erb(:'members/index')
end

get '/members/new' do
  @members = Member.all()
  erb(:'members/new')
end

post '/members' do
  Member.new(params).save
  redirect to '/members'
end

get '/members/:id' do
  @member = Member.find(params['id'].to_i)
  erb(:'members/show')
end
