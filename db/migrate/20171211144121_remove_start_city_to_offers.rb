class RemoveStartCityToOffers < ActiveRecord::Migration[5.1]
  def change
    remove_column :offers, :start_city
  end
end
