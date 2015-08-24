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

post('/admin/new-player/') do
  name = params.fetch('new_player_name')
  birthday = params.fetch('new_player_birthday')
  favorite_color = params.fetch('new_player_favorite_color')
  @player = Player.new(name: name, birthday: birthday, favorite_color: favorite_color, id: nil)
  @player.save
  erb(:player_success)
end

post('/admin/new-team/') do
  name = params.fetch('new_team_name')
  mascot = params.fetch('new_team_mascot')
  city = params.fetch('new_team_city')
  @team = Team.new(name: name, id: nil, mascot: mascot, city: city)
  @team.save()
  erb(:player_success)
end


get('/players/') do
  @players = Player.all
  erb(:players)
end

get('/teams/') do
  @teams = Team.all
  erb(:teams)
end

get('/players/:id/edit/') do
  @player = Player.find(params.fetch('id').to_i)
  erb(:player_edit)
end

get('/teams/:id/edit/') do
  @team = Team.find(params.fetch('id').to_i)
  erb(:team_edit)
end

get('/players/:id/') do
  @player = Player.find(params.fetch('id').to_i)
  erb(:player)
end

get('/teams/:id/') do
  @team = Team.find(params.fetch('id').to_i)
  erb(:team)
end

patch('/players/:id/') do
  name = params.fetch('name')
  birthday = params.fetch('birthday')
  favorite_color = params.fetch('favorite_color')
  @player = Player.find(params.fetch('id').to_i)
  @player.update({name: name, birthday: birthday, favorite_color: favorite_color})
  redirect('/players/')
end

patch('/teams/:id/') do
  name = params.fetch('name')
  mascot = params.fetch('mascot')
  city = params.fetch('city')
  @team = Team.find(params.fetch('id').to_i)
  @team.update({name: name, mascot: mascot, city: city})
  redirect('/teams/')
end
