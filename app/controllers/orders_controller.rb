class OrdersController < ApplicationController

    before_action :authenticate_user!

    def new
        @user = current_user
        @order = Order.new(user_id: @user.id)
        @ads = @user.delivery_addresses
        @ship_to_address = DeliveryAddress.new(user_id: @user.id)
    end

    def order_check
    end

    def create
    end

    def thanks
    end

    def index
    end

    def show
    end
    
end
