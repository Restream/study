require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

class Avk::FpTest < Minitest::Test
  def setup
    @array = CSV.readlines('./test/fixtures/films.csv', { headers: true })
  end

  def test_wc
    skip
  end
end
