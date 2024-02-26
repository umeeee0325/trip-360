class UsersController < ApplicationController
  def show
    @user = current_user
    @tweets = current_user.tweets
  end
end
