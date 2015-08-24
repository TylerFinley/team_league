class CreateTournament < ActiveRecord::Migration
  def change
    create_table(:tournament) do |t|
      t.column(:name, :string)
      t.column(:team_id1, :int)
      t.column(:team_id2, :int)
    end
  end
end
