require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it 'textとuser_id、tweet_idが存在していれば保存できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントが投稿できない場合' do
      it 'textが空では保存できない' do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'tweetが紐付いていないと保存できない' do
        @comment.tweet = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Tweet must exist')
      end
      it 'userが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
    end
  end
end