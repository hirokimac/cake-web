class Product < ApplicationRecord
    belongs_to :genre

    has_many :carts, dependent: :destroy
    has_many :users, through: :carts, dependent: :destroy

    attachment :image_id

end
