class Tweet < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :residence

  validates :residence_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :title, presence: true, length: { maximum: 30 }
  validates :text, presence: true, length: { maximum: 100 }
  validates :image, presence: true
  validates :city, :spot, length: { maximum: 30 }

  belongs_to :user
  has_many :comments 
end
