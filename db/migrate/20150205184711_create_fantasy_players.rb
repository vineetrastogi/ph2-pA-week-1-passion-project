class CreateFantasyPlayers < ActiveRecord::Migration
  def change
  	create_table :fantasy_players do |t|
  		t.integer :team_id
  		t.integer :player_id

  		t.timestamps
  	end
  end
end
