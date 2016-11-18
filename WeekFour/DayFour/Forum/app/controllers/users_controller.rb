class UsersController < ApplicationController
  def details
    @user = User.find params[:id]
    unless @user
      #the user doesn't exist
      redirect_to '/'
    end

  end
end
