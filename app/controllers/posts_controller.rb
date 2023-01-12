class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    user_id = current_user.id
    @post = Post.new({ **post_params, user_id: })
    if @post.save
      redirect_to posts_path
    else
      flash.now[:error] = "Could not save client"
      render :new, status: :unprocessable_entity
    end
  end

  protected

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
