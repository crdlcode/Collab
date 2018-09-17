class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new

    @user.email = params[:user][:email]
    @user.password_digest = params[:user][:password]

    if @user.save
      redirect_to '/projects/'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

end
