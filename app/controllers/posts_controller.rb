class PostsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def index
    @posts = Post.all

    #Uncomment for showing only subscribed posts
    #user_ids = current_user.event_user_ids
    # @posts = Post.where(user_id: user_ids).order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to 'posts/index'
    else
      render 'new', notice: @post.errors.full_messages.first
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to root_path}
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :address, :start_time, :end_time)
  end

  def set_user
    @user = current_user
  end

  def end_must_be_after_start
    if :start_time >= :end_time
      errors.add(:end_time, "must be after start time")
    end
  end

end
