require 'open-uri'
require 'json'


# Rushing Leader Players
rushing_leader_players = JSON.load(open("json_files/RushingLeaders.json").read)

rushing_leader_players["Rushing"].each do |item|
  Player.create(name: item["Player"], rushing: item["Statistic"].delete(',').to_i)
end

# Scoring Leader Players
scoring_leader_players = JSON.load(open("json_files/ScoringLeaders.json").read)

scoring_leader_players["Scoring"].each do |item|
  Player.create(name: item["Player"], scoring: item["Statistic"].delete(',').to_i )
end

# Touchdown Leader Players
touchdown_leader_players = JSON.load(open("json_files/TouchdownLeaders.json").read)

touchdown_leader_players["Touchdowns"].each do |item|
  Player.create(name: item["Player"], touchdown: item["Statistic"].delete(',').to_i)
end

# Receiving Leader Players
reception_leader_players = JSON.load(open("json_files/ReceptionLeaders.json").read)

reception_leader_players["Receptions"].each do |item|
  Player.create(name: item["Player"], receiving: item["Statistic"])
end

# Passing Leader Players

passing_leader_players = JSON.load(open("json_files/PassingLeaders.json").read)

passing_leader_players["PassingYards"].each do |item|
  Player.create(name: item["Player"], passyd: item["Statistic"].delete(',').to_i)
end

# Passing Touchdown Leader Players

passtd_leader_players = JSON.load(open("json_files/PassingTouchdownLeaders.json").read)

passtd_leader_players["PassingTouchdowns"].each do |item|
  Player.create(name: item["Player"], passtd: item["Statistic"].to_i)
end

# Interception Leader Players

interception_leader_players = JSON.load(open("json_files/InterceptionLeaders.json").read)

interception_leader_players["Interceptions"].each do |item|
  Player.create(name: item["Player"], interception: item["Statistic"].to_i)
end

# Sacks Leader Players

sack_leader_players = JSON.load(open("json_files/SackLeaders.json").read)

sack_leader_players["Sacks"].each do |item|
  Player.create(name: item["Player"], sacks: item["Statistic"].to_i)
end


# Player.where.not(touchdown: nil) will return all players with touchdowns
# Player.where.not(interception: nil) will return all players with interceptions

# vineet = User.create(username: "vineet", password: "dbc")
# seahawks = Team.create(name: "seawawks", user_id: vineet.id)
# seahawks.players.create(name: "LeBron", rushing: 50 )
# seahawks.players.create(name: "Jordan", touchdown: 100 )
# seahawks.players.create(name: "Tom Brady", scoring: 999 )







