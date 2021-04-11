class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :genre, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.boolean :stooped_flg, null: false, default: false
      t.text :image_id,
      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
