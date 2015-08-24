class CreatePlayers < ActiveRecord::Migration
  def change
    create_table(:players) do |t|
      t.column(:name, :string)
      t.column(:birthday, :string)
      t.column(:team_id, :int)
      t.column(:favorite_color, :string)
    end
  end
end
