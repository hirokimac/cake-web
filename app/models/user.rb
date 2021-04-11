class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :delibery_addresses, dependent: :destroy
         has_many :carts, dependent: :destroy
         has_many :products, through: :carts, dependent: :destroy
end
