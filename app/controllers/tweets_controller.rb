class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def tweet_params
    params.require(:tweet).permit(:residence_id, :title, :text, :city, :spot, :shooting_day, :image)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

# .merge(user_id: current_user.id)

