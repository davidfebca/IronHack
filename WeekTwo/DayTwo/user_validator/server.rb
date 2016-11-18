require 'sinatra'
require 'sinatra/reloader'
require './lib/user.rb'
require './lib/validator.rb'
require 'pry'
enable :sessions
validator = Validator.new
user = User.new(1,"david","patata")
user1 = User.new(2,"juanito","patata")
validator.add_user(user)
validator.add_user(user1)
get "/" do
  erb(:index)
end
post "/login" do
  username = params[:username]
  password = params[:password]
  user = validator.find_user username
  user.login
  session[:user] = "#{username}"
  redirect to ("/check")
end
get "/check" do
  user_session = session[:user]
  binding.pry
  if user_session == nil
    redirect to ("/")
  end
  user = validator.find_user user_session
  if !(user.loged)
    redirect to ("/")
  end
end
