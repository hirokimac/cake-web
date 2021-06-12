class Order < ApplicationRecord
    belongs_to :user

    has_many :order_items, dependent: :destroy

    enum pay_type: {クレジットカード:1, 銀行振込:2}

    enum order_status: {入金待ち:1,発送待ち:2,発送済み:3}

    validates :billing_amount, :pay_type, :freight, :postcode,
    :ship_address, :ship_name, :order_status, presence: true

end
