class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
    if logged_in?
      redirect_to root_url
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Welcome to the gang"
      log_in user
      redirect_to user
    else
      render "new"
    end
  end

  def edit
    unless logged_in? && current_user?(@user)
      redirect_to users_url
      flash[:danger] = "Don't get handsy boi"
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page], :per_page => 15)
  end

  def destroy
    if logged_in? && (current_user?(@user) || current_user.admin?)
      User.find(params[:id]).destroy
      flash[:success] = "User ded"
      redirect_to users_url
    else
      redirect_to users_url
      flash[:danger] = "Bitch step off"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
