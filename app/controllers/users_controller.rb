class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user = user
    @tweets = user.tweets
  end
end
