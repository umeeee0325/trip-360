require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context 'ツイートが投稿できる場合' do
      it 'residence_idが2以上で、image、title、text、user_idがあれば投稿できる' do
        expect(@tweet).to be_valid
      end
    end
    context 'ツイートが投稿できない場合' do
      it 'residence_idが1以下では投稿できない' do
        @tweet.residence_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Residence can't be blank")
      end
      it 'titleが空では投稿できない' do
        @tweet.title = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title can't be blank")
      end     
      it 'textが空では投稿できない' do
        @tweet.text = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end
      it 'imageが空では投稿できない' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Image can't be blank")
      end 
      it 'user_idが紐付いていなければ投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("User must exist")
      end
      it 'titleが31文字以上は投稿できない' do
        @tweet.title = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title is too long (maximum is 30 characters)")
      end
      it 'cityが31文字以上は投稿できない' do
        @tweet.city = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("City is too long (maximum is 30 characters)")
      end
      it 'spotが31文字以上は投稿できない' do
        @tweet.spot = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Spot is too long (maximum is 30 characters)")
      end
      it 'textが101文字以上は投稿できない' do
        @tweet.text = Faker::Internet.password(min_length: 101, max_length: 120)
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text is too long (maximum is 100 characters)")
      end
    end
  end
end
