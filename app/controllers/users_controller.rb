class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    redirect_to(new_user_registration_path, flash: { alert: t('.toke_is_invalid') }) and return if user_registration.blank?

    @user = User.new(email: user_registration.email)
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    redirect_to(new_user_registration_path, flash: { alert: t('.toke_is_invalid') }) and return if user_registration.blank?

    @user = User.new(new_user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t('.successfully_created') }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t('.successfully_updated') }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: t('.successfully_destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def new_user_params
      params
      .require(:user).permit(:login_id, :password, :name, :phone, :introduction)
      .merge(email: user_registration.email)
    end

    def user_params
      params
      .require(:user).permit(:login_id, :password, :name, :phone, :introduction, :email)
    end

    def user_registration
      UserRegistration.unused.within_time_limit.find_by(token: params[:token])
    end
end
