require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/bookings.rb' )
require_relative( '../models/classes.rb' )
require_relative( '../models/members.rb' )
also_reload( '../models/*' )

get '/classes' do
  @classes = FitClass.all()
    erb(:'classes/index')
end

get '/classes/new' do
  @classes = FitClass.all()
  erb(:'classes/new')
end

post '/classes' do
  FitClass.new(params).save
  redirect to '/classes'
end
