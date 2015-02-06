class Team < ActiveRecord::Base
  has_many :players
  belongs_to :user
  # Remember to create a migration!
end
