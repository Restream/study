module Inatra
  class << self
    def routes(&block)
      @handlers = {}
      instance_eval(&block)
    end

    def call(env)
      @request = Rack::Request.new(env)
      method = @request.request_method
      path = @request.path_info
      handler = find_handler(method, path)

      return [404, {}, ['Not found']] unless handler

      result = handler.call(env)
      if result.is_a?(String)
        [200, {}, [result]]
      else
        result
      end
    end

    def method_missing(name, path, &block)
      @handlers[name] ||= {}
      @handlers[name][path] = block
    end

    def find_handler(method, path)
      method = method.downcase.to_sym
      return unless @handlers.key?(method) && @handlers[method].key?(path)

      @handlers[method][path]
    end
  end
end
