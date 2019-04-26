require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( 'controllers/bookings_controller.rb' )
require_relative( 'controllers/classes_controller.rb' )
require_relative( 'controllers/members_controller.rb' )

get '/' do
  erb( :index )
end
