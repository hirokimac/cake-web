class OrderItem < ApplicationRecord
    belongs_to :order

    validates :name, :price, :quantity, presence: true

end
