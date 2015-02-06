require 'open-uri'
require 'json'

# Categories
categories = JSON.load(open("json_files/Categories.json").read)

categories["All Time Categories"].each do |item|
  Category.create(name: item["Category"]["text"])
end

# Players
rushing_leader_players = JSON.load(open("json_files/RushingLeaders.json").read)

rushing_leader_players["Rushing"].each do |item|
  Player.create(name: item["Player"])
end

scoring_leader_players = JSON.load(open("json_files/ScoringLeaders.json").read)

scoring_leader_players["Scoring"].each do |item|
  Player.create(name: item["Player"])
end

touchdown_leader_players = JSON.load(open("json_files/TouchdownLeaders.json").read)

touchdown_leader_players["Touchdowns"].each do |item|
  Player.create(name: item["Player"])
end

# Records
rushing_records = JSON.load(open("json_files/RushingLeaders.json").read)

rushing_records["Rushing"].each do |item|
  Record.create(statistic: item["Statistic"].to_i)
end
