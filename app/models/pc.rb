class Pc < ApplicationRecord
  has_many :item_relationships, class_name: "ItemRelationship", as: :item
  has_many :users, through: :item_relationships
end
