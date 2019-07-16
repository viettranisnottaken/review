class Relationship < ApplicationRecord
  belongs_to :following
  belongs_to :followed

  validates :following_id
  validates :followed_id
end
