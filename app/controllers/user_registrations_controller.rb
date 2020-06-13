class UserRegistrationsController < ApplicationController
  def new
    redirect_to(root_path, flash: { alert: 'already login.' }) and return if login?

    @user_registration = UserRegistration.new
  end

  def create
    redirect_to(root_path, flash: { alert: 'already login.' }) and return if login?

    @user_registration = UserRegistration.new(user_registration_params)

    if @user_registration.save
      UserRegistrationMailer.with(user_registration: @user_registration).welcome_email.deliver_later
      redirect_to root_path, flash: { success: 'You will receive an email within a few minutes, so please complete user registration.' }
    else
      render :new
    end
  end

  private

    def user_registration_params
      params.require(:user_registration).permit(:email)
    end
end
