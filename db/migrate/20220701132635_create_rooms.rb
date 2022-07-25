class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :home_type
      t.string :room_type
      t.integer :accommodate
      t.integer :bedroom
      t.integer :bathroom
      t.float :price
      t.string :listing_name
      t.text :summary
      t.boolean :is_tv
      t.boolean :is_kitchen
      t.boolean :is_internet
      t.boolean :is_heating
      t.boolean :is_ac
      t.string :address
      t.float :longitude
      t.float :latitude
      t.boolean :is_published
      t.integer :user_id

      t.timestamps
    end
  end
end
