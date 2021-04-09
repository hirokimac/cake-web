class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :last_name, :string, null: false
    change_column :users, :first_name, :string, null: false
    change_column :users, :last_name_kana, :string, null: false
    change_column :users, :first_name_kana, :string, null: false
    change_column :users, :postcode, :string, null: false
    change_column :users, :address, :text, null: false
    change_column :users, :phone_number, :string, null: false
    change_column :users, :delete_flg, :boolean, null: false, default: false
  end
end
