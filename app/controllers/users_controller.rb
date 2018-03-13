class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    build_user
    if @user.save
      flash[:success] = 'Signup was succesful'
      redirect_to login_path
    else
      flash[:danger] = 'Sign up was unsuccesful'
      render 'new', status: 400
    end
  end

  private

  def build_user
    @user = User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
