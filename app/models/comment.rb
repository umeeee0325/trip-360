class Comment < ApplicationRecord
  belongs_to :tweet, optional: true
  belongs_to :user

  validates :text, presence: true
end
