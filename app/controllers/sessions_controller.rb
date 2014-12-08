class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:create, :failure]
  # before_action :authenticate, only: :destroy
  def create

    auth_hash = request.env['omniauth.auth']
    user = User.find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])

    if user
      redirect_to :gem_notes
    else
      redirect_to :root
    end
  end

  def failure
  end

  private

  def set_provider
    @provider = params[:provider]
  end

  def user_sign_in params
    sign_in User.sign_in(@provider, params)
    @result = params
    render 'sessions/vk_success'
  end
end
