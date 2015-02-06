class Player < ActiveRecord::Base
  has_many :teams
  # Remember to create a migration!
end
