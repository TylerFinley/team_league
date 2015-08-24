require('spec_helper')

describe(Player) do
  describe('#team') do
    it("tells which team it belongs to") do
      test_player = Player.create({:name => "Fuad", :birthday => "8/8/98", :favorite_color => "green"})
      test_team = Team.create({name: "bobcats", mascot: "penguin", city: "Johannesburg", :player_id => test_player.id})
      expect(test_player.team()).to(eq(test_team))
    end
  end
end
