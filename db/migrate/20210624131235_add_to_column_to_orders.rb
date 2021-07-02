class AddToColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :ship_name, :string
  end
end
