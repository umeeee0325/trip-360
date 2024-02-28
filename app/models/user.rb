class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :age
  belongs_to :residence
  
  has_many :tweets
  has_many :comments

  validates :nickname, :profile, presence: true
  validates :gender_id, :residence_id, :age_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "は半角英数字で入力してください" }
  validates :password, presence: true, on: :create
end

