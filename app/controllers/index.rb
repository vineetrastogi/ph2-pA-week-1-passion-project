# displays home page with login prompt
get '/' do
  erb :index
end

# analyzes and stores login/registration info
post '/' do
  # checking if registration info is correct
  if params[:new_password].blank? && params[:new_username].blank?
    @error = "Type in something you must!"
    erb :index
  elsif params[:new_password].blank?
    @error = "PASSWORD IS NEEDED BRUH"
    erb :index
  else
    @new_user = User.create(username: params[:new_username], password: params[:new_password])
    @error = @new_user.errors[:username][0]
    erb :index
  end
end

get '/logout' do
  session.delete :user_id
  redirect '/'
end

# displays create_team form
get '/create_team' do
  erb :create_team
end

# allows user to enter team name
post '/create_team' do
  @user = User.find_by(username: params[:username])

  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/create_team'
  else
    erb :index
  end
  erb :create_team

end

# displays every team
get '/teams' do
  @user = User.find(session[:user_id])
  @teams = @user.teams
  erb :teams
end

# takes the last team created and adds the player which the user clicks on. This needs to be above category splat methods otherwise the splat will include /player
post '/category/player' do
  added_player = params[:player_id]
  @user = User.find(session[:user_id])

  # @user.teams.create(name: params[:team_name])
  @myteam = @user.teams.last
  @myteam.players << Player.find(added_player)
  erb :categories
end

get '/category' do
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

# creates a team based on the name inputted by the user
post '/category' do
  Team.create(name: params[:team_name], user_id: session[:user_id])
  erb :categories
end

# updates the team name with the user's input
put '/teams' do
  @team_id = params[:team_id]
  @new_name = params[:new_name]
  @current_team = Team.find(@team_id)
  @current_team.name = @new_name
  @current_team.save
  redirect '/teams'
end

# allows the user to delete a player within the team
delete '/teams' do
  player = Player.find(params[:player_id])
  player.destroy
  redirect '/teams'
end
