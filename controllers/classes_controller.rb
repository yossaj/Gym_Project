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


get '/classes/:id' do
  @class = FitClass.find(params['id'])
  erb(:'classes/show')
end

post '/classes/:id/delete' do
  fclass = FitClass.find(params['id'])
  fclass.delete()
  redirect to '/classes'
end
