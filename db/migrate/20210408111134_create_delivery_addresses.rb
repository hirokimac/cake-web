class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.integer :user_id
      t.integer :postcode
      t.text :address
      t.string :name
      t.datetime :created_id
      t.datetime :updated_id

      t.timestamps
    end
  end
end
