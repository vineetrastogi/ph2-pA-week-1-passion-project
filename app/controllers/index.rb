get '/' do
  @interceptions = Player.where.not(interception: nil)
  erb :index
end
