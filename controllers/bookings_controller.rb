require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/bookings.rb' )
require_relative( '../models/classes.rb' )
require_relative( '../models/members.rb' )
also_reload( '../models/*' )


get '/bookings' do
  @bookings = Booking.show_all_by_name
    erb(:'bookings/index')
end
