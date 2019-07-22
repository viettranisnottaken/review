class CommentsController < ApplicationController
  before_action :check_valid_user, only: [:edit, :update, :destroy]

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:success] = "Comment updated"
      redirect_to micropost_path(@comment.micropost.id)
    else
      flash[:danger] = "Comment not updated"
      redirect_to micropost_path(@comment.micropost.id)
    end
  end

  def create
    micropost = Micropost.find(params[:micropost_id])
    @comment = micropost.comments.create(content: params[:comment][:content], user: current_user, micropost: micropost)
    if @comment.save
      redirect_to micropost_path(params[:micropost_id])
      flash[:success] = "Post created"
    else
      flash[:danger] = "Post not created"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to micropost_path(@comment.micropost.id)
  end

  private

  def check_valid_user
    @comment = Comment.find(params[:id])
    unless current_user && current_user.activated && (current_user.admin || current_user == @comment.user)
      flash[:danger] = "Do u wanna taste brick?"
      redirect_to microposts_path
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
