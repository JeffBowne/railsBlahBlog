class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new

    @post =  Post.all
    @list = User.all
    @myprofile = session[:user_id]
    @person = User.find_by(id: params[:user_id])
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to new_profile_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:username, :password_digest, :password_confirmation)
  end
end
