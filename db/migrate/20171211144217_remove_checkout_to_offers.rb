class RemoveCheckoutToOffers < ActiveRecord::Migration[5.1]
  def change
    remove_column :offers, :checkout
  end
end
