class WelcomeController < ApplicationController
  before_action :set_user

  def homepage
  end

  def events
    #Uncomment for showing only subscribed posts
    @posts = current_user.all_following
  end

  private
  def set_user
    @user = current_user
  end
end
