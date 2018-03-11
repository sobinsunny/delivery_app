class SessionsController < ApplicationController
  # controller for handling user session


  def new

  end

  def create
    if  sign_in_params[:email] == 'sobin@gmail.com' and sign_in_params[:password] == "admin123"
      head :ok, content_type: "text/html"
    else
      render 'new', status: 403
    end
  end

  def destroy
  end

private

  def sign_in_params
    params.require(:user).permit(:email,:password)
  end


end
