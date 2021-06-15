class Order < ApplicationRecord
    belongs_to :user

    has_many :order_items, dependent: :destroy

    enum pay_type: {"クレジットカード":1, "銀行振込":2}

    enum order_status: { "入金待ち":0, "入金確認":1, "制作中":2, "発送準備中":3, "発送済み":4}

    validates :billing_amount, :pay_type, :freight, :postcode,
    :ship_address, :ship_name, :order_status, presence: true

end
