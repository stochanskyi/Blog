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
    header = params[:header]
    body = params[:body]
    post_validation = validate_post(header, body)
    if post_validation != true
      redirect_to posts_new_path, notice: post_validation
      return
    end
    user_id = session[:user_id]
    @user = User.find(user_id)
    @post = Post.new(
        {:header => params[:header],
         :postBody => params[:body],
         :author => "#{@user.name} #{@user.surname}",
         :authorID => @user_id})
    @post.save
    redirect_to("/posts")
  end

  def validate_post(header, body)
    if header.empty? || header.nil?
      "Post header is empty"
    elsif body.empty? || body.nil?
      "Post body is empty"
    else
      true
    end
  end
end
