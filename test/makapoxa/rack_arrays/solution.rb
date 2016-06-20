require_relative '../arrays/solution'
require 'json'

module Makapoxa
  module RackArrays
    class << self
      def call(env)
        req = Rack::Request.new(env)
        array = req.params['array']
        q = req.params['q']
        errors = []
        errors << 'array is missing' if array.nil?
        errors << 'q is missing' if q.nil?

        result = {}

        unless errors.empty?
          result[:status] = 422
          result[:errors] = errors
          return [result[:status], { 'Content-Type' => 'application/json' }, [result.to_json]]
        end
        index = Makapoxa::Arrays.search(array.map(&:to_i), q.to_i)
        if index == -1
          result[:status] = 404
          result[:errors] = "#{q} not found in [#{array.join(', ')}]"
        else
          result[:status] = 200
          result[:array] = array
          result[:q] = q
          result[:index] = index
        end

        [result[:status], { 'Content-Type' => 'application/json' }, [result.to_json]]
      end
    end
  end
end
