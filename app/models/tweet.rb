class Tweet < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :residence

  validates :residence_id, presence: true
  validates :title, presence: true
  validates :text, presence: true
  validates :image, presence: true
  validates :residence_id, numericality: { other_than: 1 }

  belongs_to :user
  has_many :comments 
end
