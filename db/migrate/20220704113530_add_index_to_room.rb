class AddIndexToRoom < ActiveRecord::Migration[6.0]
  def change
    add_index :rooms, :user_id
  end
end
