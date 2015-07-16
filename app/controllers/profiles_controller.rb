class ProfilesController < ApplicationController
  def index
    if session[:user_id] != nil
      @user = User.find_by(id: session[:user_id])
    else 
      @user = "Not logged in"
    end

    # @other = params[:user_id]
    # @user = User.find(session[:user_id]) 
    # @user2 = User.find(params[:format])
    @me = User.find_by(id: params[:user_id])
    
    @mypost = Post.where(user_id: session[:user_id])

    # if @post.present?
    #   @post = @me.posts
    # else
    #   @post = []
    # end

    @profile = Profile.find_by(params[:id])
  end





  def show
    if session[:user_id] != nil
      @user = User.find_by(id: session[:user_id])
    else 
      @user = "Not logged in"
    end

    @otherperson = User.find_by(id: params[:user_id])

    @otherspost = Post.where(user_id: params[:user_id])


    @profile = Profile.find_by(params[:id])

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
