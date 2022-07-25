class UpdateReviewTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :type, :review_type
    remove_column :reviews, :user_id
  end
end
