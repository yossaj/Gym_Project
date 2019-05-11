require( 'sinatra' )
require('pg')
# require( 'sinatra/contrib/all' )
# require( 'pry-byebug' )
require_relative( '../models/bookings.rb' )
require_relative( '../models/classes.rb' )
require_relative( '../models/members.rb' )
# also_reload( '../models/*' )

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
  @member = Member.find(params['id'])
  @classes = @member.show_classes_for_member
  erb(:'members/show')
end

get '/members/:id/edit' do
  @member = Member.find(params['id'])
erb(:'members/edit')
end

post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect to '/members'
end


post '/members/:id/delete' do
  member = Member.find(params['id'])
  member.delete()
  redirect to '/members'
end
