class SessionsController < ApplicationController
  # controller for handling user session
  # before_action :authenticate_user, only: [:destroy]

  def new
    @session = User::SignIn.new
  end

  def create
    build_session
    if @session.save
      set_user_session
      flash[:sucess] = 'Succesful'
      redirect_to orders_path
    else
      flash[:error] = 'Invalid'
      render 'new', status: 403
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def build_session
    @session = User::SignIn.new(sign_in_params)
  end

  def set_user_session
    session[:user_id] = user.id
  end

  def user
    User.find_by(email: sign_in_params[:email])
  end

  def sign_in_params
    params.require(:user_sign_in).permit(:email, :password)
  end
end
