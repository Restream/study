$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'coveralls'
Coveralls.wear!

require 'minitest/autorun'

require 'wrong'
require 'wrong/adapters/minitest'

Wrong.config.color

class Minitest::Test
  include Wrong
end
