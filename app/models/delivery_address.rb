class DeliveryAddress < ApplicationRecord
    belongs_to :user

    validates :postcode, presence: true
    validates :postcode, format: { with: /\A\d{7}\z/ }
    validates :address, presence: true
    validates :name, presence: true

end
