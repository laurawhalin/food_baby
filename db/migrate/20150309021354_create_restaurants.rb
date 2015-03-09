class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.boolean :kid_friendly
      t.boolean :kids_menu
      t.string :address
      t.string :locality
      t.string :region
      t.string :postcode
      t.string :phone_number
      t.string :website
      t.string :cuisine

      t.timestamps null: false
    end
  end
end
