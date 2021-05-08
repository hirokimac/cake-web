class ProductsController < ApplicationController

    before_action :authenticate_user!, except: [:index]

    def new
        @product = Product.new
        @Genres = Genre.all
    end

    def create
        @product = Product.new(product_params)
     if @product.save
      redirect_to user_path(current_user.id)
     else
      render template: "homes/top"
     end
    end

    def show
        @product = Product.find(params[:id])
        @cart = Cart.new(product_id: @product.id)
    end

    def index
        @products = Product.all
        @products = Product.page(params[:page]).per(4)
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to user_path(current_user.id)
    end

    private
    def product_params
        params.require(:product).permit(:name,:description,:genre_id,:product_image,:price)
    end

end
