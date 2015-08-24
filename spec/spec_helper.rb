ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")
require("sinatra/activerecord")
require("players")
require('teams')
require('pry')

RSpec.configure do |config|
  config.after(:each) do
    Player.all().each() do |player|
      Player.destroy()
    end
  end
end
