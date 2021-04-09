class ChangeColumnToDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :delivery_addresses, :user_id, :integer
    add_foreign_key :delivery_addresses, :user, foreign_key: true
    change_column :delivery_addresses, :postcode, :integer, null: false
    change_column :delivery_addresses, :address, :text, null: false
    change_column :delivery_addresses, :name, :string, null: false
    remove_columns :delivery_addresses, :created_id, :updated_id
  end
end
