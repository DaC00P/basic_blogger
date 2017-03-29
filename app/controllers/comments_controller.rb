class CommentsController < ApplicationController

  before_action :select_comment, only: [:edit, :update, :show, :destroy, :sold]

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.post)
    else
      flash[:notice] = "Error creating comment: #{@comment.errors}"
      redirect_to(@comment.post)
    end
  end

  def update
    @comment = Comment.update_attributes(comment_params)

    if @comment.save
      flash[:notice] = 'Comment was successfully edited.'
      redirect_to(@comment.post)
    else
      flash[:notice] = "Error modifying comment: #{@comment.errors}"
      redirect_to(@comment.post)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
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
