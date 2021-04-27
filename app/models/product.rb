class Product < ApplicationRecord
    belongs_to :genre

    has_many :carts, dependent: :destroy
    has_many :users, through: :carts, dependent: :destroy

    attachment :product_image

    validates :description, length: { maximum: 200 }
    validates :description, presence: true
    validates :name, presence: true
    validates :price, presence: true

    enum stopped_flg: {販売中: false, 売り切れ: true }
    
end
