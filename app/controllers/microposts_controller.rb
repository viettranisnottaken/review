class MicropostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @microposts = Micropost.paginate(page: params[:page], per_page: 30).order(created_at: :desc)
    # @microposts = Micropost.all
    @micropost = current_user.microposts.build
  end

  def show
  end

  def edit
  end

  def update
    if @micropost.update_attribute(:content, params[:content])
      redirect_to @microposts
      flash[:success] = "Post updated"
    else
      render :index
      flash[:danger] = "Well suit yourself"
    end
  end

  def new
    # @micropost = current_user.microposts.build
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Post created"
      redirect_to action: :index
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Post deleted"
    redirect_to action: :index
  end

  private

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
