class AuthController < ApplicationController
  def index

  end

  def registration

  end

  def login
    is_login_success = User.exists?(email: params[:email], password: params[:password])
    if is_login_success
      @user = User.find_by_email(params[:email])
      session[:user_id] = @user.id
      redirect_to("/posts")
    else
      redirect_to "/", notice: "Invalid credentials"
    end
  end

  def register_user
    password = params[:password]
    confirm_password = params[:confirm_password]
    if password != confirm_password
      #Show error
      return
    end
    name = params[:name]
    surname = params[:surname]
    email = params[:email]

    @user = User.new({:name => name, :surname => surname, :email => email, :password => password})
    @user.save
    redirect_to("/")
  end

  def logout
    session.clear
    redirect_to("/")
  end
end
