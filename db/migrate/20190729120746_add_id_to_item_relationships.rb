class AddIdToItemRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :item_relationships, :item_id, :integer
  end
end
