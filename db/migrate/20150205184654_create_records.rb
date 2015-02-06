class CreateRecords < ActiveRecord::Migration
  def change
  	create_table :records do |t|
  		t.integer :player_id
  		t.integer :category_id
  		t.integer :statistic

  		t.timestamps
  	end
  end
end
