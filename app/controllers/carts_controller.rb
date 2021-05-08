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

    if  @cart.save
        redirect_to carts_path
    else
        render ("products/show")
    end
    end

    def index
        @carts = current_user.carts
    end

    def update
    end

    def destroy
        user = current_user
        cart = Cart.find(params[:id])
        cart.destroy
        redirect_to cart_path(user.id)
    end

    def destroy_all
    end

    private
    def cart_params
        params.require(:cart).permit(:user_id, :product_id, :quantity,)
    end

end
