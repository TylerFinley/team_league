class CreateTeams < ActiveRecord::Migration
  def change
    create_table(:teams) do |t|
      t.column(:name, :string)
      t.column(:mascot, :string)
      t.column(:city, :string)
      t.column(:player_id, :int)
      t.timestamps()
    end
  end
end
