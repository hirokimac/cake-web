class ChangeColumnToProduts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :integer, null: false
  end
end
