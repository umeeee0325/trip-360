class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :edit]

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
    @tweet = Tweet.find(params[:id])
    unless current_user == @tweet.user
      redirect_to root_path
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
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
end


