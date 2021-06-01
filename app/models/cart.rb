class Cart < ApplicationRecord
    belongs_to :user
    belongs_to :product

    validates :quantity, presence: true

    def sum_of_price
        product.price * quantity
    end

    def add_tax_sum_of_price
        (self.sum_of_price * 1.10).round
    end

end
