class UsersController < ApplicationController

  def new

  end

  def create
    if  user_params.present?
      head :ok, content_type: "text/html"
    else
      render 'new', status: 500
    end
  end

private

def user_params
  params.require(:user).permit(:name,:email,:password,:password_confirmation)
end

end
