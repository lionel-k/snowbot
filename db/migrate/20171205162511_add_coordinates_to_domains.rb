class AddCoordinatesToDomains < ActiveRecord::Migration[5.1]
  def change
    add_column :domains, :latitude, :float
    add_column :domains, :longitude, :float
  end
end
