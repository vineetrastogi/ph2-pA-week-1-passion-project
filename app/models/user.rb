require 'bcrypt'

class User < ActiveRecord::Base
  has_many :teams
  include BCrypt

  validates :username, :presence => {:message => "Type in username you must"}
  validates :username, :uniqueness => {:message => "Please stop trying to steal other people's usernames."}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      give_token
      # else
      #   redirect_to home_url
    end
  end
end
