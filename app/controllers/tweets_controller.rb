class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :edit]
  before_action :set_tweet, only: [:edit, :show, :update]

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

  def edit
    unless current_user == @tweet.user
      redirect_to root_path
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def tweet_params
    params.require(:tweet).permit(:residence_id, :title, :text, :city, :spot, :shooting_day, :image).merge(user_id: current_user.id)

  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end


