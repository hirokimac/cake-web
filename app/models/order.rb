class Order < ApplicationRecord
    belongs_to :user

    has_many :order_items, dependent: :destroy

    enum payment: {クレジットカード:1, 銀行振込:2}

    enum order_status: {入金待ち:0, 入金確認:2, 制作中:3, 発送準備中：4, 発送済み:5 }

    validates :billing_amount, :pay_type, :freight, :postcode,
    :ship_address, :ship_name, :order_status, presence: true

end
