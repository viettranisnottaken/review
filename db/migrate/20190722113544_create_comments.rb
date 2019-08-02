class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :comment_container_id
      t.string :comment_container_type

      t.timestamps
    end
  end
end