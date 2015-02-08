def helper_category(category)
  Player.where.not({category => nil})
end


