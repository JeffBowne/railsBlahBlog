class CommentsController < ApplicationController
  def index
    @user = User.all
  end

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:content))
    @comment.user_id = session[:user_id]
    @comment.save
    redirect_to post_path(@post)
  end

  def destroy
  end
end
