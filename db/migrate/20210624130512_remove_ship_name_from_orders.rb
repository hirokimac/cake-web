class RemoveShipNameFromOrders < ActiveRecord::Migration[5.2]
  def up
    remove_column :orders, :ship_name, :string    
  end
  
  def down
    add_column :orders, :last_name, :string
    add_column :orders, :first_name, :string
    add_column :orders, :last_name_kana, :string
    add_column :orders, :first_name_kana, :string
  end
end
