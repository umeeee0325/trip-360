class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to '/'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:residence_id, :title, :text, :city, :spot, :shooting_day)
  end
end

# .merge(user_id: current_user.id)

