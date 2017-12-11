class RemoveGuestsNumberToOffers < ActiveRecord::Migration[5.1]
  def change
    remove_column :offers, :guests_number
  end
end
