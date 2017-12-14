class AddOffersToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :offer, foreign_key: true, index: true
  end
end
