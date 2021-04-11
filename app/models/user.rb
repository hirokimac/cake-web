class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :delibery_addresses, dependent: :destroy
         has_many :orders, dependent: :destroy
         has_many :carts, dependent: :destroy
         has_many :products, through: :carts, dependent: :destroy

         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :last_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :email, presence: true
         validates :postcode, presence: true
         validates :postcode, format: { with: /\A\d{7}\z/ }
         validates :address, presence: true
         validates :phone_number, presence: true
         validates :phone_number, format: { with: /\A\d{10,11}\z/ }
         validates :delete_flg, inclusion: { in: [true, false]}

         enum delete_flg: {入会: false, 退会: true }

end
