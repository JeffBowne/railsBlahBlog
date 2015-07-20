class ProfilesController < ApplicationController
  def index
    # @other = params[:user_id]
    # @user = User.find(session[:user_id]) 
    # @user2 = User.find(params[:format])
    @me = User.find_by(id: session[:user_id])
    @mypost = Post.where(user_id: session[:user_id])
    @profile = Profile.find_by(user_id: session[:user_id])
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
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update_attributes(profile_params)
    redirect_to user_profile_path(current_user, @profile.id)
    
    # @profile = Profile.new(profile_params)
    # @profile.user_id = session[:user_id]
    # @profile.save
    # redirect_to profile_path(@profile.id)

    # @profile = Profile.where(user_id: session[:user_id]).first
    # @profile.name = params[:name]
    # @profile.email = params[:email]
    # @profile.city = params[:city]
    # @profile.image = params[:image] 
    # @profile.save
  end

  def destroy
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :email, :city, :image)
  end
end
