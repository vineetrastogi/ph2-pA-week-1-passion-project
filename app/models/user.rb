class User < ActiveRecord::Base
  has_many :players, through :team
  # Remember to create a migration!
end
