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
    if User.exists?(email: params[:email])
      redirect_to auth_registration_path, notice: "User with this email already exists"
      return
    end
    password = params[:password]
    confirm_password = params[:confirm_password]
    password_validation = validate_password(password, confirm_password)
    if password_validation != true
      redirect_to auth_registration_path, notice: password_validation
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

  def validate_password(password, password_conf)
    if password.length < 8
      "Password should be more then 8 chars"
    elsif password != password_conf
      "Password and confirmation should be same"
    else
      true
    end
  end
end
