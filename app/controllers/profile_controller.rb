class ProfileController < ApplicationController

    before_action :require_user_logged_in!      #this method defined in application_controller-ensures user is logged in

    def edit
        @user = User.find_by(email: Current.user.email)
        #@email = @user.email
    end

    def update
        if Current.user.update(user_params)
            redirect_to root_path, notice: "Profile updated successfully"
        else
            render :edit    
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :name, :age, :yoe, :skills, :resume, :phone)
    end
end