# displays home page with login prompt
get '/' do
  erb :index
end

# analyzes and stores login info
post '/' do
  user = User.find_by(username: params[:username])

  if user.password == params[:password]
    session[:user_id] = user.id
    redirect '/login'
  end
  "Please login, BRUH."
end

# displays every team
get '/teams' do
  @teams = Team.all
  erb :teams
end

# takes the last team created and adds the player which the user clicks on. This needs to be above category splat methods otherwise the splat will include /player
post '/category/player' do
  added_player = params[:player_id]
  @myteam = Team.last
  @myteam.players << Player.find(added_player)
  erb :categories
end

# lists the categories to choose from
get '/category/*' do
  @category = params[:splat][0].to_s
  @players = helper_category(@category)
  erb :players
end

# after adding a player, redirects you back to the list of categories
post '/category/*' do
  erb :categories
end

# allows user to enter team name
post '/create_team' do
  erb :create_team
end

# creates a team based on the name inputted by the user
post '/category' do
  Team.create(name: params[:team_name])
  erb :categories
end

# put '/category' do
#   erb :categories
# end

put '/teams' do
  @team_id = params[:team_id]
  @new_name = params[:new_name]
  @current_team = Team.find(@team_id)
  @current_team.name = @new_name
  @current_team.save
  # @current_team.update_attribute(name: @new_name)
  redirect '/teams'
end

delete '/teams' do
  # @team_id = params[:team_id]
  # @player_id = params[:player_id]
  # @current_team = Team.find(@team_id)
  # @current_team.players.find(@player_id).destroy
  player = Player.find(params[:player_id])
  player.destroy
  redirect '/teams'
end

get '/logout' do
  session.delete :user_id
  redirect '/'
end

