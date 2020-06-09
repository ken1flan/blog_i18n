class SessionsController < ApplicationController
  def new
    @session_form = Forms::Session.new
  end

  def create
    reset_session
    @session_form = Forms::Session.new(session_params)
    if @session_form.save
      redirect_to root_path, flash: { success: 'Logged in.' }
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, flash: { success: 'Logged out.' }
  end

  private

  def session_params
    params.require(:session).permit(:login_id, :password).merge(session: session)
  end
end
