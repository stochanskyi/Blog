class AuthController < ApplicationController
  def index

  end

  def login
    redirect_to("/")
  end
end
