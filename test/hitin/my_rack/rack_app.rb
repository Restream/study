require 'rack'
require_relative '../arrays/solution.rb'
require 'json'

class MyApp
 def call(env)
   req = Rack::Request.new(env)
   array = req.params["array"]
   n = req.params["n"]  
   action = req.params["action"] 
   errors = []
   errors << "array is missing" if array.nil?   
   errors << "n is missing" if n.nil?
   errors << "action is missing" if action.nil?
  # errors << "unknown action" if action != "move" || action != "search"
   if errors.length > 0
     response = JSON.generate({status: "422", errors: "#{errors}"})
     return [422, {"Content-Type" => "application/json"}, [response]]
   end
   if action == "search"
	 result = Hitin::Arrays.search(array, n)
	 if result == -1
	   response = JSON.generate({status: "404", message: "#{n} not found in #{array}"})
	 else
	   response = JSON.generate({status: "200", array: array, n: n, index: result})
	 end
   end
   if action == "move"
     result = Hitin::Arrays.move(array, n.to_i)
     response = JSON.generate({status: "200", array: array, n: n, move_ar: result})
   end
   [200, {"Content-Type" => "application/json"}, [response]]
 end
end
