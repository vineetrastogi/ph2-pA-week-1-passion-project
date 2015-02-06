class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :rushing
      t.integer :touchdown
      t.integer :scoring

      t.timestamps
    end
  end
end
