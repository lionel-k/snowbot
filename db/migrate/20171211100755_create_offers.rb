class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key: true
      t.integer :guests_number
      t.string :checkin
      t.string :checkout
      t.string :start_city
      t.references :domain, foreign_key: true
      t.string :flat_id_homeaway
      t.string :flat_title
      t.text :flat_photo
      t.float :flat_price_by_night
      t.float :flat_ratings
      t.string :flat_location
      t.string :car_id_drivy
      t.float :car_price
      t.string :car_title
      t.text :car_photo

      t.timestamps
    end
  end
end
