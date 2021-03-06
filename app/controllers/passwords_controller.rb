class PasswordsController < ApplicationController

    before_action :require_user_logged_in!      #this method defined in application_controller-ensures user is logged in


    def edit
    end
 
    def update
        if Current.user.update(password_params)
            redirect_to root_path, notice: "Password Successfully Changed"
        else
            render :edit
        end    
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end

end