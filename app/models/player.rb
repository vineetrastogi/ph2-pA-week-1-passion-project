class Player < ActiveRecord::Base
  belongs_to :team
  # Remember to create a migration!
end
