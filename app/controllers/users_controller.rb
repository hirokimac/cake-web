class UsersController < ApplicationController

    before_action :authenticate_user!
    
    def show
        @user = current_user
    end

    def edit
    end

    def update
    end

    def quit
    end

    def withdrawal
    end

    def withdrawal_updata
    end

end
