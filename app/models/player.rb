class Player < ActiveRecord::Base
  has_many_and_belongs_to_many :teams
  # Remember to create a migration!
end

# has_many_and_belongs_to :teams
# has_many_and_belongs_to :players

# create players_teams join table
	# set id to false
	# t.belongs :team
	# t. belong :player
