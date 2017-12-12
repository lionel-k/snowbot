class AddQueryInUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :query, :jsonb, default: {}
  end
end
