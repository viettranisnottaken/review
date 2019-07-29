class RemoveIdFromItemRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :item_relationships, :laptop_id, :integer
    remove_column :item_relationships, :pc_id, :integer
  end
end
