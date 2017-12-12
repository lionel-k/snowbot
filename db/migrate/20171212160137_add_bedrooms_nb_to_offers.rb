class AddBedroomsNbToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :bedrooms_nb, :integer
  end
end
