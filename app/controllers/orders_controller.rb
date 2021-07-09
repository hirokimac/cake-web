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
        @user = current_user
        @order = Order.new
        @order.user_id = params[:order][:user_id]
        @order.billing_amount = params[:order][:billing_amount]
        @order.freight = params[:order][:freight]
        @order.postcode = params[:order][:postcode]
        @order.ship_address = params[:order][:ship_address]
        @order.ship_name = params[:order][:ship_name]
        @order.pay_type = params[:order][:pay_type]
        if @order.save
            redirect_to thanks_orders_path
        else 
            binding.pry
            redirect_to new_order_path(params[:order][:user_id])
        end
        
        @carts = current_user.carts
        @TAX = 1.10
        @carts.each do |cart_item|
            OrderItem.create(
                order_id: @order.id,
                product_id: cart_item.product_id,
                name: cart_item.product.name,
                quantity: cart_item.quantity,
                price: (cart_item.product.price * cart_item.quantity * @TAX).round
            )
        end
        
        @carts.destroy_all

    end

    def thanks
    end

    def index
        @user = current_user
        @orders = @user.orders
    end
    
    def show
        @user = current_user
        @order = Order.find(params[:id])
        @order_items = @order.order_items
    end

    
end

