class FollowsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @post = Post.find(params[:post_id])
    current_user.follow(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    current_user.stop_following(@post)
  end
end
