class HomesController < ApplicationController

    before_action :authenticate_user!, except: [:top,:about]

    def top
        @products = Product.all
        @products = Product.page(params[:page]).per(4)
    end

    def about
    end


end
