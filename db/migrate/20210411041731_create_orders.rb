class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.references :user, null: false, foreign_key: true
      t.integer :billing_amount, null: false
      t.string :pay_type, null: false
      t.integer :freight, null: false
      t.integer :postcode, null: false
      t.text :ship_address, null: false
      t.string :ship_name, null: false
      t.integer :order_status, null: false
      t.timestamps
    end
  end
end
