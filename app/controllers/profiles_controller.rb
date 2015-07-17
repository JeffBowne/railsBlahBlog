class ProfilesController < ApplicationController
  def index
    # @other = params[:user_id]
    # @user = User.find(session[:user_id]) 
    # @user2 = User.find(params[:format])
    @me = User.find_by(id: params[:user_id])
    @mypost = Post.where(user_id: session[:user_id])
    @profile = Profile.find_by(params[:id])
  end

  def show
    @otherperson = User.find_by(id: params[:user_id])
    @otherspost = Post.where(user_id: params[:user_id])
    @profile = Profile.find_by(params[:id])
  end


  def other
  end


  def new
  @profile = Profile.new
  end


  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = session[:user_id]
    @profile.save
    redirect_to '/'
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def profile_params
    params.require(:new_profile).permit(:name, :email, :city)
  end
end
