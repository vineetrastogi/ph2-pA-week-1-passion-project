get '/' do
  erb :index
end

get '/category/*' do
  category = params[:splat][0].to_s
  @players = helper_category(category)
  erb :players
end


get '/teams/player/add/:id' do
  @interceptions = Player.where.not(interception: nil)
  @myteam = Team.first
  @myteam.players << Player.find(params[:id])
  erb :index
end

