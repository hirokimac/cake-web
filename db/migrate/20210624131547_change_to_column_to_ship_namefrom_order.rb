class ChangeToColumnToShipNamefromOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :ship_name, :string, null: false

  end
end
