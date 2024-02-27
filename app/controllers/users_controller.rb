class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @user = user
    @tweets = @user.tweets
  end

  def edit
    @user = current_user
  end

end
