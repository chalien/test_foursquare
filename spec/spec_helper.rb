ENV['RACK_ENV'] = "test"
require "simplecov"
SimpleCov.start

SimpleCov.start do
  add_filter "/spec/"
end

module Foursquare2
class Client
end
end

require File.expand_path("../../lib/colombia_trip/colombia_trip", __FILE__)
Dir[File.expand_path("../../lib", __FILE__)+ "/**/**.rb"].each{ |file| require file }

require "rspec"
RSpec.configure do |config|

  config.before(:suite) do
  end

  config.before(:each) do
  end

  config.after(:each) do
  end

end


