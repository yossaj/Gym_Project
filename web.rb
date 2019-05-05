require 'sinatra'
require_relative( 'controllers/bookings_controller.rb' )
require_relative( 'controllers/classes_controller.rb' )
require_relative( 'controllers/members_controller.rb' )

get '/' do
    "Hello"
    erb( :index )
end
