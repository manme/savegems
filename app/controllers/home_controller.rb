class HomeController < ApplicationController
  skip_before_action :authenticate_user

  before_action :authorized

  def index
  end

  private

  def authorized
    redirect_to :gem_notes if signed_in?
  end
end
