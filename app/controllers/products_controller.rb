class ProductsController < ApplicationController

    before_action :authenticate_user!, except: [:index]

    def new
    end

    def create
    end

    def show
    end

    def index
    end

    def destroy
    end

end
