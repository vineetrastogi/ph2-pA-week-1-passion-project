class Team < ActiveRecord::Base
  has_and_belongs_to_many :players
  belongs_to :user
  # Remember to create a migration!
end

# belongs_to :user