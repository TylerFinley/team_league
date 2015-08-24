class AddPlayerIdToTeams < ActiveRecord::Migration
  def change
    add_column(:teams, :player_id, :int)
  end
end
