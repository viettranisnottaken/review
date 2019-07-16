class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :user_id, presence: true
  validates :content, presence: true
end
