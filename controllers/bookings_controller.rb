require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/bookings.rb' )
require_relative( '../models/classes.rb' )
require_relative( '../models/members.rb' )
also_reload( '../models/*' )


get '/bookings' do
  @bookings = Booking.show_all_by_name
  @link = Booking.all
    erb(:'bookings/index')
end

get '/bookings/:id' do
  @booking = Booking.find(params['id'])
  @temp = @booking.first.show_booking_by_name
  @show = @temp.first

  erb(:'bookings/show')
end
