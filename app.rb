require( 'sinatra' )
require('pg')
# require( 'sinatra/contrib/all' )
# require( 'pry-byebug' )
require_relative( 'controllers/bookings_controller.rb' )
require_relative( 'controllers/classes_controller.rb' )
require_relative( 'controllers/members_controller.rb' )
require_relative( 'controllers/test_page.rb' )

get '/' do
  erb( :index )
end
