class ChangeColumnHomeAwayToJsonb < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :homeaway_data
    add_column :orders, :homeaway_data, :jsonb, default: '{}'
  end
end
