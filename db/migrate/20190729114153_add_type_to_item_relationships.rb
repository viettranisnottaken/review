class AddTypeToItemRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :item_relationships, :item_type, :string
  end
end
