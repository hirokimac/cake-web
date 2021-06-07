class CartsController < ApplicationController

    before_action :authenticate_user!

    def create
        @cart = current_user.carts.new(cart_params)
        # カートの中に同じ商品が重複しないようにして　古い商品と新しい商品の数量を合わせる
        @update_cart =  Cart.find_by(product: @cart.product)
        if  @update_cart.present? && @cart.valid?
            @cart.quantity += @update_cart.quantity
            @update_cart.destroy
        end
    if  @cart.save(cart_params)
        redirect_to carts_path(current_user.id)
    else
        @product = Product.find(params[:cart][:product_id])
        @cart = Cart.new
        render ("products/show")
    end
    end

    def index
        @TAX = 1.10
        @total_price = 0
        @user = current_user
        @carts = current_user.carts

        @carts.each do |cart|
        price = (cart.product.price * cart.quantity * @TAX).round
        @total_price = price + @total_price
        end
    end

    def update
        @user = current_user
        @cart = Cart.find(params[:id])
        @cart.update(cart_params)
        redirect_to carts_path(current_user.id)
    end

    def destroy
        cart = Cart.find(params[:id])
        cart.destroy
        redirect_to carts_path(current_user.id)
    end

    def destroy_all
        cart = current_user.carts
        cart.destroy_all
        redirect_to carts_path(current_user.id)
    end

    private
        def cart_params
            params.require(:cart).permit(:quantity)
        end    
    
end