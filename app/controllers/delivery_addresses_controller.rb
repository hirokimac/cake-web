class DeliveryAddressesController < ApplicationController

    before_action :authenticate_user!

    def index
        @user = current_user
        @new_delivery_address = DeliveryAddress.new
        @delivery_addresses = @user.delivery_addresses
    end

    def create
        @user = current_user
        delivery_address = DeliveryAddress.new(delivery_address_params)
        delivery_address.user_id = current_user.id
        if delivery_address.save
            redirect_to user_path(@user.id)
        else
            @user = current_user
        @new_delivery_address = DeliveryAddress.new
        @delivery_addresses = @user.delivery_addresses
            render :index
        end
    end

    def edit
        @delivery_address = DeliveryAddress.find(params[:id])
    end

    def update
        user = current_user
        delivery_address = DeliveryAddress.find(params[:id])
        if delivery_address.update(delivery_address_params)
            redirect_to delivery_addresses_path(user.id)
        else
          render :edit
        end
    end

    def destroy
        user = current_user
        delivery_address = DeliveryAddress.find(params[:id])
        delivery_address.destroy
        redirect_to delivery_addresses_path(user.id)
    end

    private
    def delivery_address_params
        params.require(:delivery_address).permit(:postcode, :address,:name)
    end

end
