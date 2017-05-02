require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza')

# INDEX - READ
get '/pizzas' do
  @pizzas = Pizza.all()   # all() is in the pizza.rb class
  erb( :index )           # see RESTful table same name as the erb action file
end

# NEW - CREATE
get '/pizzas/new' do
  erb( :new )
end

# SHOW - READ see RESTful table we need to write a show.erb
get '/pizzas/:id' do
  # id_from_route
  @pizza = Pizza.find( params[:id] )
  erb( :show )            
end

# CREATE - CREATE this is what happens when you submit a pizza order
post '/pizzas' do         
  # pass in 'params' hash to access pizza.rb variables
  # Note here the @pizza so that create.erb can access the variables e.g total()
  @pizza = Pizza.new( params ) 
  @pizza.save()  
  erb( :create )
end

# DESTROY DELETE
post '/pizzas/:id/delete' do
  @pizza = Pizza.delete( params[:id] )
  erb( :destroy )
end
