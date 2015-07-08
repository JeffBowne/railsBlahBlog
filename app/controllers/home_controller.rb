require 'bcrypt'

class HomeController < ApplicationController
  
  def index
    @user  = User.find_by(id: session[:user_id])
    @post =  Post.all
  end

  def login
    @sample = ['Blue','Red','Yellow']
  end


  def login_process
    user = User.find_by_username(params[:username])
    if user = User.authenticate(params[:username], params[:password])
      session[:current_user_id] = user.id
      redirect_to '/'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to '/'
  end

end


    # if session[:user_id].nil?
    #   redirect_to '/signin'
    # else 
    #   redirect_to '/'
    # end 