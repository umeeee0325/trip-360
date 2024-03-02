class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :edit, :show]
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]

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
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def destroy
    @tweet.comments.destroy_all
    @tweet.destroy
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:residence_id, :title, :text, :city, :spot, :shooting_day, :image).merge(user_id: current_user.id)

  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end


