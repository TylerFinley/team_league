require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/players')
require('./lib/teams')

get('/') do
  erb(:index)
end
