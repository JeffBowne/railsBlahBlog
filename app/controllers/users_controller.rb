class UsersController < ApplicationController


  def index
  end

  def show
  end

  def new
    @user = User.new
    @session = session.new
  end

  def create
    @user = User.create(params[:user])
    session[:user_id] = @user.id
    redirect_to '/'
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
