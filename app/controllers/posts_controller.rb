class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end
end
