require './rack_app.rb'

use Rack::Reloader

run MyApp.new
