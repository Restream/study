require './rack_app.rb'
#require './myrackmiddleware.rb'

use Rack::Reloader
#use MyRackMiddlewareErrors

run MyApp.new