class Micropost < ApplicationRecord
  has_many :comments, as: :comment_container
  belongs_to :user

  validates :content, presence: true
end
