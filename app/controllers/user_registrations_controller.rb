class UserRegistrationsController < ApplicationController
  def new
    @user_registration = UserRegistration.new
  end

  def create
    @user_registration = UserRegistration.new(user_registration_params)

    format.html { render :new } unless @user_registration.save
  end

  private

    def user_registration_params
      params.require(:user_registration).permit(:email, :token, :user_id, :expired_at)
    end
end
