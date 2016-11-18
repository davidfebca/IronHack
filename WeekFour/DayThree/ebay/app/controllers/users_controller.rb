class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
      @my_user = User.new
  end
  def create
      @existing_user = User.find_by email: params[:user][:email]
      if @existing_user == nil
        #TODO: password is a string...nyeee
        @new_user = User.new(name:params[:user][:name],username:params[:user][:username],email:params[:user][:email],password:params[:user][:password])
        @new_user.save
      end
      redirect_to '/users'
  end
  def delete
    @user = User.find params[:id]
    if @user != nil
      @user.destroy
    end
    redirect_to '/users'
  end
end
