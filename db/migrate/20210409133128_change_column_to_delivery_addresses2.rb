class ChangeColumnToDeliveryAddresses2 < ActiveRecord::Migration[5.2]
  def change
    add_reference  :delivery_addresses,  :user, foreign_key: true
  end
end
