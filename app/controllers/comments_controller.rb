class CommentsController < ApplicationController

  before_action :select_comment, only: [:edit, :update, :show, :destroy]

  def new
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id

    @post = Post.find(params[:post_id])

    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.post)
    else
      flash[:notice] = "Error creating comment: #{@comment.errors.full_messages}"
      redirect_to(@post)
    end
  end

  def edit
    @post = Post.find(@comment.post_id)
  end

  def update
    @comment.update_attributes(comment_params)
    @post = Post.find(@comment.post_id)

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

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
