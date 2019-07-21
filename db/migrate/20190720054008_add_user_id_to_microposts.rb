class AddUserIdToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :user, :refereces
  end
end
