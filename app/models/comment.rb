class Comment < ApplicationRecord
  belongs_to :comment_container, polymorphic: true
  belongs_to :user
  belongs_to :micropost
end
