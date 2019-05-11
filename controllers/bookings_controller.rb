require( 'sinatra' )
require('pg')
# require( 'sinatra/contrib/all' )
# require( 'pry-byebug' )
require_relative( '../models/bookings.rb' )
require_relative( '../models/classes.rb' )
require_relative( '../models/members.rb' )
# also_reload( '../models/*' )


get '/bookings' do
  @bookings = Booking.show_all_by_name
  @link = Booking.all
    erb(:'bookings/index')
end

get '/bookings/:id' do
  @booking = Booking.find(params['id'])
  erb(:'bookings/show')
end

get '/bookings/:id/edit' do
  @booking = Booking.find(params['id'])
  @classes = @booking.all_classes
  erb(:'bookings/edit')
end

post '/bookings/:id' do
  booking = Booking.new(params)
  booking.update
  redirect to '/bookings'
end

post '/bookings/:id/delete' do
  booking = Booking.find(params['id'])
  booking.delete
  redirect to '/bookings'
end
