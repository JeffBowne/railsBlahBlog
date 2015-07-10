class ProfilesController < ApplicationController
  def index
    @other = params[:user_id]
    @user = User.find(session[:user_id])
    @person = User.find_by(id: params[:format])
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
  end

  def create
    @user = User.find(session[:user_id])
    @profile = Profile.new(params[:new_profile].permit(:name, :email, :city))
    @profile.user_id = @user.id
    @profile.save
    redirect_to '/profile'
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def new_profile_params
    params.require(:new_profile).permit(:name, :email, :city)
  end
end
