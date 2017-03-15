require 'rack'
require_relative '../arrays/solution.rb'
require 'json'

class MyApp
  def call(env)
    req = Rack::Request.new(env)
    array = req.params['array']
    n = req.params['n']
    action = req.params['action']
    not_found = -1
    errors = []
    errors << 'array is missing' if array.nil?
    errors << 'n is missing' if n.nil?
    errors << 'action is missing' if action.nil?
    unless errors.empty?
      response = JSON.generate { status:'422', errors: errors.to_s }
      return [422, { 'Content-Type' => 'application/json' }, [response]]
    end
    if action == 'search'
      result = Hitin::Arrays.search(array, n)
      response = if result == not_found
                   JSON.generate { status:'404', message: "#{n} not found in #{array}" }
                 else
                   JSON.generate { status:'200', array: array, n: n, index: result }
                 end
    end
    if action == 'move'
      result = Hitin::Arrays.move(array, n.to_i)
      response = JSON.generate { status:'200', array: array, n: n, move_ar: result }
    end
    [200, { 'Content-Type' => 'application/json' }, [response]]
  end
end
