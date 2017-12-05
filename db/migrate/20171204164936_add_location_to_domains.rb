class AddLocationToDomains < ActiveRecord::Migration[5.1]
  def change
     add_column :domains, :location, :string
  end
end
