class PostsController < ApplicationController
  def new
  end

  def all
    @posts = Post.all
  end

  def save
    @post = Post.new({:header => params[:header], :postBody => params[:body], :author => "asfd",  :authorID => "1231"})
    @post.save
    redirect_to("/")
  end
end
