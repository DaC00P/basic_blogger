class PostsController < ApplicationController

  def index
    @posts = Post.all
    p @posts
  end
end
