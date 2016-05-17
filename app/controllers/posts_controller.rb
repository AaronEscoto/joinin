class PostsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def index
    @posts = Post.all
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
      redirect_to posts_path
    else
      render 'new', notice: @post.errors.full_messages.first
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def follow
    @post = Post.find(params[:id])

    if current_user
      current_user.follow(@post)
      redirect_to :back, :notice => "You successfully joined into an event!"
    else
      redirect_to :back, :notice => "You must <a href='/users/sign_in'>login</a> to follow that post."
    end
  end

  def unfollow
    @post = Post.find(params[:id])

    if current_user
        current_user.stop_following(@post)
        redirect_to :back, :notice => "You successfully backed out of an event"
    else
      redirect_to :back, :notice => "You must <a href='/users/sign_in'>login</a> to follow that post."
    end
  end

  def new_comment
    @post = Post.find(params[:id])
    @post.comments << Post.new(comment_params)
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit!
  end

  def post_params
    params.require(:post).permit(:title, :address, :start_time, :end_time, :body)
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
