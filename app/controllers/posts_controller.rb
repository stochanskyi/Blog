class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new

  end

  def save
    @post = Post.new({:header => params[:header], :postBody => params[:body], :author => "asfd",  :authorID => "1231"})
    @post.save
    redirect_to("/")
  end
end
