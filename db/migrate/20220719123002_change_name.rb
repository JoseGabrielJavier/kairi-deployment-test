class ChangeName < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :type, :review_type
  end
end
