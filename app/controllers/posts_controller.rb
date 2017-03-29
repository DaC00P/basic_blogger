class PostsController < ApplicationController

  before_action :select_post, only: [:edit, :update, :show, :destroy, :sold]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to(@post)
    else
      flash[:notice] = "Error creating post: #{@post.errors.full_messages}"
      redirect_to(@post)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'Post was successfully edited.'
      redirect_to(@post)
    else
      flash[:notice] = "Error modifying post: #{@post.errors.full_messages}"
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
