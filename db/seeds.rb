require 'open-uri'
require 'json'

# # Categories
# categories = JSON.load(open("json_files/Categories.json").read)

# categories["All Time Categories"].each do |item|
#   Category.create(name: item["Category"]["text"])
# end

# Rushing Leader Players
rushing_leader_players = JSON.load(open("json_files/RushingLeaders.json").read)

rushing_leader_players["Rushing"].each do |item|
  Player.find_or_create_by(name: item["Player"], rushing: item["Statistic"].delete(',').to_i)
end

# Scoring Leader Players
scoring_leader_players = JSON.load(open("json_files/ScoringLeaders.json").read)

scoring_leader_players["Scoring"].each do |item|
  Player.find_or_create_by(name: item["Player"], scoring: item["Statistic"].delete(',').to_i )
end

# Touchdown Leader Players
touchdown_leader_players = JSON.load(open("json_files/TouchdownLeaders.json").read)

touchdown_leader_players["Touchdowns"].each do |item|
  Player.find_or_create_by(name: item["Player"], touchdown: item["Statistic"].delete(',').to_i)
end

