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

# Receiving Leader Players
touchdown_leader_players = JSON.load(open("json_files/ReceptionLeaders.json").read)

reception_leader_players["Receptions"].each do |item|
  Player.find_or_create_by(name: item["Player"], receiving: item["Statistic"])
end

# Passing Leader Players

touchdown_leader_players = JSON.load(open("json_files/PassingLeaders.json").read)

reception_leader_players["PassingYards"].each do |item|
  Player.find_or_create_by(name: item["Player"], passingyd: item["Statistic"])
end

# Passing Touchdown Leader Players

touchdown_leader_players = JSON.load(open("json_files/PassingTouchdownLeaders.json").read)

reception_leader_players["PassingTouchdowns"].each do |item|
  Player.find_or_create_by(name: item["Player"], passtd: item["Statistic"])
end


# Interception Leader Players

touchdown_leader_players = JSON.load(open("json_files/PassingLeaders.json").read)

reception_leader_players["PassingYards"].each do |item|
  Player.find_or_create_by(name: item["Player"], passingyd: item["Statistic"])
end

# Sacks Leader Players

touchdown_leader_players = JSON.load(open("json_files/PassingLeaders.json").read)

reception_leader_players["PassingYards"].each do |item|
  Player.find_or_create_by(name: item["Player"], passingyd: item["Statistic"])
end


