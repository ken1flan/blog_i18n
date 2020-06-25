class UserRegistrationMailer < ApplicationMailer
  def welcome_email
    @user_registration = params[:user_registration]
    mail(to: @user_registration.email, subject: t('.subject'))
  end
end
