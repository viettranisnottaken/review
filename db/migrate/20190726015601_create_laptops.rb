class CreateLaptops < ActiveRecord::Migration[5.2]
  def change
    create_table :laptops do |t|
      t.string :name
      t.string :processor
      t.integer :ram

      t.timestamps
    end
  end
end
