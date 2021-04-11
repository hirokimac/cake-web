class Product < ApplicationRecord
    belongs_to :genre

    has_many :carts, dependent: :destroy
    has_many :users, through: :carts, dependent: :destroy

    attachment :image_id

    validates :description, length: { maximum: 200 }

    enum stopped_flg: {販売中: false, 売り切れ: true }
    
end
