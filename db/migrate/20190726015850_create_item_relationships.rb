class CreateItemRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :item_relationships do |t|
      t.references :user, foreign_key: true
      t.references :laptop, foreign_key: true
      t.references :pc, foreign_key: true

      t.timestamps
    end
  end
end
