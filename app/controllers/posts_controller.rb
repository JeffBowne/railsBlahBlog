class PostsController < ApplicationController
  
  def index
  end


  def show
    @post = Post.find(params[:id])
    @sessionid = session[:user_id]
    @author = @post.user_id
    @postby = User.find_by(id: @author).username
    @myprofile = session[:user_id]
  end


  def new
    @sessionid = session[:user_id]
    @myprofile = session[:user_id]
    @post = Post.new
  end


  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    @post.save
    redirect_to post_path(@post.id)
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to '/'
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end


  private
  def post_params
    params.require(:post).permit(:user_id, :title, :content)
  end
end
