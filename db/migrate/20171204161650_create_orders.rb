class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :guests_number
      t.string :checkin
      t.string :checkout
      t.string :start_city
      t.string :drivy_data
      t.string :homeaway_data
      t.references :domain, foreign_key: true
      t.integer :total_price
      t.string :status

      t.timestamps
    end
  end
end
