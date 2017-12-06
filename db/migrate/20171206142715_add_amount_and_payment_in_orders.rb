class AddAmountAndPaymentInOrders < ActiveRecord::Migration[5.1]
  def change
    add_monetize :orders, :amount, currency: { present: false }
    add_column :orders, :payments, :jsonb
  end
end
