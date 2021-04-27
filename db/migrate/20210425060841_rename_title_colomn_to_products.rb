class RenameTitleColomnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :image_id, :product_image_id
  end
end
