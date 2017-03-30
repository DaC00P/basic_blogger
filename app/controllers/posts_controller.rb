class PostsController < ApplicationController

  before_action :select_post, only: [:edit, :update, :show, :destroy]
  before_action :ensure_post_modification_security, only: [:edit, :update, :destroy]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  #TODO swap the redirect_to for a render when post is not created. use flash.now instead of flash!!
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

  def show
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def edit

  end

  #TODO swap the redirect_to's for a render. use flash.now instead of flash!!
  def update
    if @post.update(post_params)
      flash[:notice] = 'Post was successfully edited.'
      redirect_to(@post)
    else
      flash[:notice] = "Error modifying post: #{@post.errors.full_messages}"
      redirect_to(@post)
    end
  end

  def destroy
    @post.destroy
    redirect_to(@post)
  end

  private
  def select_post
    @post = Post.find(params[:id])
  end

  #TODO swap the redirect_to's for a render. use flash.now instead of flash!!
  def ensure_post_modification_security
    unless @post.user_id == current_user.id
      flash[:notice] = "Only a post's creator can edit or delete it"
      redirect_to(@post)
    end
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
