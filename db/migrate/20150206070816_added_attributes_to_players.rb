class AddedAttributesToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :receiving, :integer
    add_column :players, :passyd, :integer
    add_column :players, :interception, :integer
    add_column :players, :sacks, :integer
    add_column :players, :passtd, :integer
  end
end
