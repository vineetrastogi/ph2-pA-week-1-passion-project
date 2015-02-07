get '/' do
  erb :index
end

post '/' do
  user = User.find_by(username: params[:username])

  if user.password == params[:password]
    session[:user_id] = user.id
    redirect '/login'
  end
  "Please login, BRUH."
end

get '/teams' do
  # @category = params[:splat][0].to_s
  # @myteam = Team.first
  # @myteam.players << Player.find(params[:id])
  erb :teams
end

post '/teams/:id' do
  # p params
  @id = Player.find(params[:player_id])
end

get '/category/*' do
  @category = params[:splat][0].to_s
  @players = helper_category(@category)
  erb :players
end

post '/category/*' do
  added_player = params[:player_id]
end

post '/login' do
  erb :login
end

get '/logout' do
  session.delete :user_id
  redirect '/'
end

