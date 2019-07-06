class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_url
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to user
      flash[:success] = "Enjoy your stay. Your mom gay btw"
    else
      render "new"
      flash[:error] = "sth is wrong"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
    flash[:info] = "Bye bye now"
  end
end
