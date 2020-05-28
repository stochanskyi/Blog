class AuthController < ApplicationController
  def index

  end

  def login
    is_login_success = User.exists?(email: params[:email], password: params[:password])
    redirection = ""
    if is_login_success
      @user = User.find_by_email(params[:email])
      session[:user_id] = @user.id
      redirect_to(redirection)
    else
      flash.now[:notice] = "User not found."

    end

  end
end
