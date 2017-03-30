class CommentsController < ApplicationController

  before_action :select_comment, only: [:edit, :update, :show, :destroy]
  before_action :ensure_comment_modification_security, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  #TODO swap the redirect_to's for a render. use flash.now instead of flash!!
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id

    @post = Post.find(params[:post_id])

    #TODO swap the redirect_to for a render
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.post)
    else
      flash[:notice] = "Error creating comment: #{@comment.errors.full_messages}"
      redirect_to(@post)
    end
  end

  def show

  end

  def edit
    @post = Post.find(@comment.post_id)
  end

  #TODO swap the redirect_to's for a render. use flash.now instead of flash!!
  def update
    @comment.update_attributes(comment_params)
    @post = @comment.post

    if @comment.save
      flash[:notice] = 'Comment was successfully edited.'
      redirect_to(@comment.post)
    else
      flash[:notice] = "Error modifying comment: #{@comment.errors.full_messages}"
      redirect_to(@post)
    end
  end

  def destroy
    @comment.destroy

    redirect_to(@comment.post)
  end

  private
  def select_comment
    @comment = Comment.find(params[:id])
  end

  #TODO swap the redirect_to's for a render. use flash.now instead of flash!!
  def ensure_comment_modification_security
    unless @comment.user_id == current_user.id
      flash[:notice] = "Only a comment's creator can edit or delete it"
      redirect_to(@comment.post)
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
