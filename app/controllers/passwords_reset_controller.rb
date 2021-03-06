class PasswordsResetController < ApplicationController

    #before_action :require_user_logged_in!      #this method defined in application_controller-ensures user is logged in

    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
            #send mail
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        redirect_to root_path, notice: "If email found in our DB, You will receive an email."
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature     # throws this error if token expires, rescuing and redirecting
        redirect_to sign_in_path, notice: "You token has expired, Please try again."
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Password reset done, please login."
        else
            render :edit    
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
