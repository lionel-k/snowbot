class AddNameUrlToDomains < ActiveRecord::Migration[5.1]
  def change
    add_column :domains, :name_url, :string
  end
end
