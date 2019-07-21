class Commment < ApplicationRecord
  belongs_to :comment_container, polymorphic: true
end
