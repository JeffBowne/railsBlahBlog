class ProfilesController < ApplicationController
  def index
    # @other = params[:user_id]
    @user = User.find(session[:user_id]) 
    # @user2 = User.find(params[:format])
    @person = User.find_by(id: params[:format])
    @person2 = User.find_by(id: params[:user_id])
    if @post.present?
      @post = @person.posts
    else
      @post = []
    end
    @profile = Profile.find_by(params[:id])
  end

  def show
 #   @thisGuy = User.find_by(username: params[:username])
 #   @profile = Profile.find_by(params[:id])
   # @user = @profile.user
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
