class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy, :show]

  def show
  end

  def edit
  end

  def update
    #code
  end

  def create
    @comment.user = current_user
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.new(comment_params)
    if @comment.save
      redirect_to micropost_path(@micropost)
    else
      @comments = @micropost.comments
      render template: 'microposts/show'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
