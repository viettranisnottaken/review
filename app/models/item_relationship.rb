class ItemRelationship < ApplicationRecord
  belongs_to :user
  # belongs_to :laptop
  # belongs_to :pc
  belongs_to :item, polymorphic: true


end
