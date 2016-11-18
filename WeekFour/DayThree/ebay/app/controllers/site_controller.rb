class SiteController < ApplicationController
  def index
  end
  def login
    username = params[:user][:username]
    password = params[:user][:password]
    existing_user = User.find_by username: username
    unless existing_user
      redirect_to '/'
      return
    end
    if existing_user.password != password
      redirect_to '/'
      return
    end
    session[:user_id] = existing_user.id.to_s
    redirect_to '/products'
  end
end
