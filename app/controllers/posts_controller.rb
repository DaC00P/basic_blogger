class PostsController < ApplicationController

  before_action :select_post, only: [:edit, :update, :show, :destroy, :sold]

  def index
    @posts = Post.all
  end



  private
  def select_post
    
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
