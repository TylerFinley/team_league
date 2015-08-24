require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/players')
require('./lib/teams')

get('/') do
  erb(:index)
end

get('/admin/') do
  erb(:admin)
end

post('/admin/new/') do
  name = params.fetch('new_player_name')
  @player = Player.new(name: name, id: nil)
  @player.save
  erb(:player_success)
end



get('/player/') do
  @players = Player.all
  erb(:player)
end

get('/player/:id/edit/') do
  @player = Player.find(params.fetch('id').to_i)
  erb(:player_edit)
end

patch('/player/:id/') do
  name = params.fetch('name')
  birthday = params.fetch('birthday')
  favorite_color = params.fetch('favorite_color')
  @player = Player.find(params.fetch('id').to_i)
  @player.update({name: name, birthday: birthday, favorite_color: favorite_color})
  redirect('/player/')
end
