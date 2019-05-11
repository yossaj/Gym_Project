require( 'sinatra' )
# require( 'sinatra/contrib/all' )



get '/test' do
    erb(:'test')
end
