class ChangeColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :order_status, :integer, null: false, default: "入金待ち"

  end
end
