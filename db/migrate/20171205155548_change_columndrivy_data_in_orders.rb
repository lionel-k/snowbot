class ChangeColumndrivyDataInOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :drivy_data
    add_column :orders, :drivy_data, :jsonb, default: '{}'
  end
end
