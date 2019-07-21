class MicropostsController < ApplicationController
  before_action :check_valid_user, only: [:destroy, :edit, :update]
  before_action :set_micropost, only: [:edit, :update, :destroy, :show]

  def index
    @micropost = current_user.microposts.build
    @microposts = Micropost.paginate(page: params[:page], per_page: 15).order(created_at: :desc)
  end

  def create
    # @micropost = current_user.microposts.create!(content: params[:micropost][:content]) also possible if u dont like strong params
    @micropost = current_user.microposts.create!(micropost_params)
    if @micropost.save
      flash[:success] = "Nice post lel"
      redirect_to action: :index
    else
      render :index
    end
  end

  def show
    
  end

  def edit
  end

  def update
    if @micropost.update_attributes(micropost_params)
      flash[:success] = "Post updated"
      redirect_to action: :show
    else
      redirect_to action: :index
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Post deleted"
    redirect_to action: :index
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

  def set_micropost
    @micropost = Micropost.find(params[:id])
  end

  def check_valid_user
    unless current_user.admin || (current_user && current_user.activated && logged_in?)
      flash[:danger] = "Pls activate your account"
      redirect_to microposts_path
    end
  end
end
