class PostsController < ApplicationController

  before_action :select_post, only: [:edit, :update, :show, :destroy, :sold]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to(@post)
    else
      flash[:notice] = "Error creating post: #{@post.errors}"
      redirect_to(@post)
    end
  end

  def update
    @post = Post.update_attributes(post_params)

    if @post.save
      flash[:notice] = 'Post was successfully edited.'
      redirect_to(@post)
    else
      flash[:notice] = "Error modifying post: #{@post.errors}"
      redirect_to(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to(@post)
  end

  private
  def select_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
