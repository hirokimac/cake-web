class OrdersController < ApplicationController

    before_action :authenticate_user!

    def new
        @order = current_user.orders.new
        @ads = current_user.delivery_addresses
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
