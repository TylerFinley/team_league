ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")
require("sinatra/activerecord")
require("players")
require('teams')
require('pry')
