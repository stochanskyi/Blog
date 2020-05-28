class PostsController < ApplicationController
  def new
  end

  def all
    @posts = Post.all
  end

  def save
    user_id = session[:user_id]
    @user = User.find(user_id)
    @post = Post.new({:header => params[:header], :postBody => params[:body], :author => @user.name,  :authorID => @user_id})
    @post.save
    redirect_to("/")
  end
end
