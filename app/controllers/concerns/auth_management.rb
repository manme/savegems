module Concerns
  module AuthManagement
    def sign_in(user)
      session[:user_hash] = user.utoken
    end

    def sign_out
      session[:user_hash] = nil
    end

    def current_user
      @_current_user ||= User.find_by(utoken: session[:user_hash]) if session[:user_hash]
    end

    def signed_in?
      !current_user.nil?
    end

    def authenticate_user_from_token!
      user_token = params[:access_token]
      @user = user_token && User.find_by(access_token: user_token)

      unless @user
        render json: { status: :error, code: 401, message: :unauthenticated }
      end
    end

    def redirect_back_or_to(url, flash_hash = {})
      redirect_to(session[:return_to_url] || url, flash: flash_hash)
      session[:return_to_url] = nil
    end
    #
    def authenticate_user
      unless signed_in?
        if request.xhr?
          render json: { status: :error, code: 401, message: :unauthenticated }
        else
          session[:return_to_url] = request.url if request.get?
          redirect_to :root
        end
      end
    end
  end
end
