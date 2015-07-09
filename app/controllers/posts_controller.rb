class PostsController < ApplicationController
  
  def index
  end

  def show
    if session[:user_id] != nil
      @user  = User.find_by(id: session[:user_id]).username
    else 
      @user = "Not logged in"
    end

    @post = Post.find(params[:id])

    @sessionid = session[:user_id]
    @author = @post.user_id
    @postby = User.find_by(id: @author).username
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = session[:user_id]
    @post.save
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    redirect_to '/'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end

end
