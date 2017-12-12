class ChangeBedroomsNbToOffers < ActiveRecord::Migration[5.1]
  def change
    rename_column :offers, :bedrooms_nb, :flat_bedrooms_nb
  end
end
