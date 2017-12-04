class CreateDomains < ActiveRecord::Migration[5.1]
  def change
    create_table :domains do |t|
      t.string :name
      t.string :mountain_chain
      t.boolean :is_sunny
      t.string :forecast_data
      t.integer :snow_depth_low
      t.integer :snow_depth_high

      t.timestamps
    end
  end
end
