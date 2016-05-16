class WelcomeController < ApplicationController
  before_action :set_user

  def homepage
  end

  private
  def set_user
    @user = current_user
  end
end
