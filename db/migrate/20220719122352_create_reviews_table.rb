class CreateReviewsTable < ActiveRecord::Migration[6.0]
    def change
      create_table :reviews do |t|
        t.integer :star
        t.text :comment
        t.string :review_type
        t.references :reservation, null: false, foreign_key: true
  
        t.timestamps
      end
    end
end
