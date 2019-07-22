class AddMicropostToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :micropost, foreign_key: true
  end
end
