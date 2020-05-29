class PostsController < ApplicationController
  def new
    if session[:user_id] == nil
      redirect_to("/")
    end
  end

  def all
    if session[:user_id] == nil
      redirect_to("/")
    end
    @posts = Post.all
  end

  def save
    user_id = session[:user_id]
    @user = User.find(user_id)
    @post = Post.new({:header => params[:header], :postBody => params[:body], :author => @user.name, :authorID => @user_id})
    @post.save
    redirect_to("/posts")
  end
end
