class UsersController < ApplicationController

    before_action :authenticate_user!
    
    def show
        @user = current_user
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to user_path(@user.id)
        else
          render :edit
        end
    end

    def quit
    end

    def withdrawal
        @user = User.find(params[:id])
        @user.update(delete_flg: true)
        reset_session
        redirect_to root_path
    end

    def withdrawal_updata
    end

    private
    def user_params
      params.require(:user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number,:email)
    end

end

