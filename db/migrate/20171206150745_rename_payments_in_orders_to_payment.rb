class RenamePaymentsInOrdersToPayment < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :payments, :payment
  end
end
