class CommentsController < ApplicationController
  def edit

  end

  def update
    #code
  end

  def create
    micropost = Micropost.find(params[:id])
    @comment = micropost.comments.create(content: params[:comment][:content])
    if @comment.save
      redirect_to micropost_path
      flash[:success] = "Post created"
    else
      flash[:danger] = "Post not created"
    end
  end
end
