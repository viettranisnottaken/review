class MicropostsController < ApplicationController
  before_action :check_valid_user, only: [:destroy]
  before_action :get_micropost, only: [:edit, :update, :destroy, :show]

  def index
    # @microposts = Micropost.all
    @microposts = Micropost.paginate(page: params[:page], per_page: 15).order(created_at: :desc)
    @micropost = current_user.microposts.build
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to posts_path
      flash[:success] = "Nice post, nibba"
    else
      render :index
    end
  end

  def edit
  end

  def update
    if current_user
      if @micropost.update_attributes(micropost_params)
        #strong params requires update_attributes
        redirect_to action: :index
        flash[:success] = "Post updated!"
      else
        render :index
      end
    else
      redirect_to action: :index
      flash[:danger] = "Imma throw your baby if you keep being nosy"
    end
  end

  def show
    @comments = @micropost.comments
  end

  def destroy
    @micropost.destroy
    redirect_to posts_path
    flash[:success] = "One less regret in the next 10 years"
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

  def get_micropost
    @micropost = Micropost.find(params[:id])
  end

  def check_valid_user
    unless current_user.admin? || (current_user && current_user.activated && logged_in?)
      redirect_to root_path
      flash[:danger] = "Do u wanna taste brick?"
    end
  end

end
