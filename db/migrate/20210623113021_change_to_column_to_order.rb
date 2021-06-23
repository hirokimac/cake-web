class ChangeToColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :pay_type, :integer, null: false
  end
end