require 'bcrypt'

class HomeController < ApplicationController
  def index
    @post =  Post.all
    @list = User.all
    @myprofile = session[:user_id]
    @person = User.find_by(id: params[:user_id])
  end

  def login
    @post =  Post.all
    @list = User.all
    @myprofile = session[:user_id]
    @person = User.find_by(id: params[:user_id])
  end


  def login_process
      @user = User.where(username: params[:username]).first   
  if @user && @user.password_digest == params[:password_digest]     
    session[:user_id] = @user.id
    redirect_to '/'   
  else     
    redirect_to '/login'   
  end 

    #  @user = User.find_by_username(params[:username])
    # # If the user exists AND the password entered is correct.
    # if @user && @user.authenticate(params[:password])
    #   # Save the user id inside the browser cookie. This is how we keep the user 
    #   # logged in when they navigate around our website.
    #   session[:user_id] = @user.id
    #   redirect_to '/'
    # else
    # # If user's login doesn't work, send them back to the login form.
    #   redirect_to '/login'
    # end
  end

  def logout
    session.clear
    redirect_to '/'
  end

  def deletecheck
  end
  
  def deleteself
    @user = User.where(id: session[:user_id]).first
    @user.destroy

    @profiles = Profile.where(user_id: session[:user_id]).first
    @profiles.destroy

    session.clear
    redirect_to '/'
  end

  def deleteall 
    @user = User.where(id: session[:user_id]).first
    @user.destroy

    @profiles = Profile.where(user_id: session[:user_id]).first
    @profiles.destroy

    @posts = Post.where(user_id: session[:user_id])
    @posts.destroy_all

    @comments = Comment.where(user_id: session[:user_id])
    @comments.destroy_all

    session.clear
    redirect_to '/'
  end


end


