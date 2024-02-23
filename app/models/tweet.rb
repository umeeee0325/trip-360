class Tweet < ApplicationRecord
  has_one_attached :image

  validates :residence_id, presence: true
  validates :title, presence: true
  validates :text, presence: true
  validates :image, presence: true

  belongs_to :user 
end
