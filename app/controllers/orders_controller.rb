class OrdersController < ApplicationController

    before_action :authenticate_user!

    def new
        @user = current_user
        @order = Order.new(user_id: @user.id)
        @ads = @user.delivery_addresses
        @ship_to_address = DeliveryAddress.new(user_id: @user.id)
    end
    
    def order_check
        @TAX = 1.10
        @total_price = 0
        @user = current_user
        @carts = current_user.carts

        @carts.each do |cart|
        price = (cart.product.price * cart.quantity * @TAX).round
        @total_price = price + @total_price
        end

        @order = Order.new
        @pay = params[:order][:pay_type]
        @ads = @user.delivery_addresses
        if params[:_add] == "usersAdd"
            @order.postcode = @user.postcode
            @order.ship_address = @user.address
            @order.ship_name = @user.last_name
        elsif params[:_add] == "shipAdds"
            @ad = @ads.find(params[:Delivery_addresses][:id])
            @order.postcode = @ad.postcode
            @order.ship_address = @ad.address
            @order.ship_name = @ad.name
        elsif params[:_add] == "newAdd"
        #ship_to_addressテーブルに保存させる
            @ad = DeliveryAddress.new
            @ad.user_id = @user.id
            @order.postcode = params[:ship_to_address][:postcode]
            @order.ship_address = params[:ship_to_address][:address]
            @order.ship_name = params[:ship_to_address][:name]
        end
    end
    
    def create
        @ad.postcode = params[:ship_to_address][:postcode]
        @ad.ship_address = params[:ship_to_address][:address]
        @ad.ship_name = params[:ship_to_address][:name]
        @ad.save
    end

    def thanks
    end

    def index
    end

    def show
    end
    
    
end

