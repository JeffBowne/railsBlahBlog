class ProfilesController < ApplicationController
  def index
  end

  def show
    @user = User.find(session[:user_id])
    @profile = Profile.create( profiles_params )
  end

  def new
  end

  def create
    @user = User.find(session[:user_id])
    @profile = Profile.new(params[:new_profile])
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
end
