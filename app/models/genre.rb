class Genre < ApplicationRecord
    has_many :products, dependent: :destroy

    enum stopped_flg: {有効: false, 無効: true }

end
