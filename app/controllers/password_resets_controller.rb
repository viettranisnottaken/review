class PasswordResetsController < ApplicationController
  # before_action :valid_user, only: [:edit, :update]
  before_action :check_reset_expiration, only: [:edit, :update]


  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email])
    if @user
      @user.create_reset_digest
      UserMailer.password_reset(@user).deliver_now
      redirect_to root_url
      flash[:info] = "Please check your email"
    else
      flash[:danger] = "Shove that forged email up your ass"
      render :new
    end
  end

  def edit
    @user = User.find_by(email: params[:email].downcase)
  end

  def update
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.activated? && @user.authenticated?("reset", params[:id])
      if params[:user][:password].empty?
        @user.errors.add(:password, "can't be empty")
        render 'edit'
      elsif @user.update_attributes(user_params)
        log_in @user
        flash[:success] = "Password has been reset."
        redirect_to @user
      else
        render 'edit'
      end
    else
      redirect_to root_url
      flash[:danger] = "Have you activated or received your password reset email?"
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def valid_user
    unless (@user && @user.activated? &&
      @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  def check_reset_expiration
    if @user && @user.reset_expired?
      flash[:danger] = "Password reset expired"
      redirect_to new_password_reset_url
    end
  end

end
