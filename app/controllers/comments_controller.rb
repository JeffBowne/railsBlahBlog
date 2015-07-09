class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.user_id = session[:user_id]
    redirect_to post_path(@post)
  end

  def destroy
  end
end
